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

        ; Now we have just the code to work with, so we can check for syntax errors
        ; First, handle Script and EndScript
        length := StrLen(data)
        line := 1
        script_open := 0
        Loop %length%
        {
            ; Keep track of the line number
            if (SubStr(data, A_Index, 1) == "`n") line++

            s := InStr(data, "Script", true, A_Index)
            if (s == A_Index)
            {
                ; Make sure the symbol really is "Script" (not "EndScript")
                check := Trim(SubStr(data, s - 3, s), " `r`n`t")
                if (check == "EndScript")
                    continue
                else
                    script_open := true

                ; Make sure the Script symbol has a corresponding EndScript
                if (script_open)
                {
                    e := InStr(data, "EndScript", true, s + 1)
                    if (e == 0)
                    {
                        MsgBox Error in script at line %line%: Script missing EndScript
                        return
                    }
                    else
                    {
                        MsgBox % SubStr(data, s + 7, e - 10)
                        script_open := false
                    }
                }
            }
        }
    }
}