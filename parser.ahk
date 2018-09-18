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

        ; Remove comments
        data := RegExReplace(data, ";.{0,}\r\n", "`r`n")

        ; Replace line breaks with semicolons
        data := StrReplace(data, "`r", "")
        data := StrReplace(data, "`n", ";`")

        ; Trim unnecessary whitespace
        data := RegExReplace(data, " {1,}|\t{1,}", " ")

        ; Separate each line into its own string
        data := StrSplit(data, ";")

        ; Now we have just the code to work with, so we can check for syntax errors
        ; First, handle Script and EndScript
        this._scripts := this.GetScripts(data)

        ; NEXT: The GetScripts function should return the list of lines between Script and EndScript.
        ; Once that's done, the next thing will be to actually executing what's in the script;
        ; From there, I think the next logical step will be to do the same with functions.
        ; And beyond that it's all about the API, so I'll cross that bridge when I get there. :)
        MsgBox Left off here
    }

    /**
     * Parses a string of code to get a list of scripts
     * @param[in] The code to parse as an array
     * @return An array of strings, each string being the code
     * between the "Script" and "EndScript" symbols
     */
    GetScripts(data)
    {
        ; Declare variables
        scripts := array()          ; This gets returned in the end
        length := StrLen(data)      ; The length of the string  to be parsed
        script_open := false        ; Used to check for syntax errors

        Loop % data.MaxIndex()
        {
            ; Check for nested Script / Script inside Script
            if (StringStartsWith(Trim(data[A_Index], " `t`r`n"), "Script"))
            {
                if (script_open)
                    MsgBox Error in line %A_Index%: A script can't contain another script
                else
                    script_open := true
            }

            ; Check for EndScript withou Script
            if (StringStartsWith(Trim(data[A_Index], " `t`r`n"), "EndScript"))
            {
                if (!script_open)
                    MsgBox Error in line %A_Index%: EndScript without Script
                else
                    script_open := false
            }

            ; Check for Script without EndScript
            if (A_Index == data.MaxIndex() - 1 && script_open)
                MsgBox Error in line %A_Index%: Script without EndScript
        }
        
        return scripts
    }
}