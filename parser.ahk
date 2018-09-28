#include %A_ScriptDir%\misc.ahk

/**
 * This takes the raw data from script files, checks for errors,
 * and sets up the stuff the interpreter will need to run the code.
 */
class Parser
{
    __new()
    {
        this._scripts := array()
    }

    /**
     * Parses the raw data into a format the program can use
     * @param[in] The filename
     */
    ParseFile(file)
    {
        ; Read the file into memory
        FileRead, data, %file%
        data .= "`r`n"

        ; Replace the strings with a placeholder
        found := 1
        
        ; Collect all the strings and replace them with placeholders
        strings := array()
        Loop
        {
            found := RegExMatch(data, """.{0,}""", s, found)
            if (found == 0)
                break
            data := StrReplace(data, s, "{str" . A_Index . "}", 0, 1)
            strings.push(s)
            found += 1
        }

        ; Remove comments
        data := RegExReplace(data, ";.{0,}\r\n", "`r`n")

        ; Replace line breaks with semicolons
        data := StrReplace(data, "`r", "")
        data := StrReplace(data, "`n", ";`")

        ; Trim unnecessary whitespace
        data := RegExReplace(data, " {1,}|\t{1,}", " ")

        ; Separate each line into its own string
        data := StrSplit(data, ";")

        ; Replace the string placeholders with the strings
        Loop % data.MaxIndex()
        {
            line := data[A_Index]
            replace := ""
            Loop % strings.MaxIndex()
            {
                if (InStr(line, "{str" . A_Index . "}"))
                {
                    replace := StrReplace(line, "{str" . A_Index . "}", strings[A_Index])
                }
            }
            if (replace != "")
                data[A_Index] := replace
        }
        
        ; Now we have just the code to work with, so we can check for syntax errors etc.
        this.GetScripts(data)
    }

    /**
     * Parses a string of code to get a list of scripts
     * @param[in] The code to parse as an array
     * @return An array of strings, each string being the code
     * between the "Script" and "EndScript" symbols
     */
    GetScripts(data)
    {
        current_script := array()
        in_script := false
        Loop % data.MaxIndex()
        {
            ; Skip empty lines
            line := Trim(data[A_Index], " `t`r`n")

            ; Handle the "Script" (script start) keyword
            if (StringStartsWith(line, "Script "))
            {
                ; Check to make sure the script follows the pattern:
                ; Script MyScriptName(optional hotkey, I'll get to that later)
                if (!this.isFunction(SubStr(line, 8)))
                {
                    MsgBox Error on line %A_Index%: Invalid Script start
                    return
                }
            }
            else if (StringStartsWith(line, "Script"))
            {
                ; Do all the same stuff for "Script" without the space
                if (!this.isFunction(SubStr(line, 7)))
                {
                    MsgBox Error on line %A_Index%: Invalid Script start
                    return
                }
            }
        }
    }

    /**
     * Checks if a string follows the standard pattern expected for a function
     * @pram {string} str The string to evaluate
     * @return {bool} True if it matches, false if it doesn't
     */
    isFunction(str)
    {
        return RegExMatch(str, "^[a-zA-Z_][0-9a-zA-Z_]{0,}\(.{0,}\)$|^[a-zA-Z_][0-9a-zA-Z_]{0,} \(.{0,}\)$")
    }
}