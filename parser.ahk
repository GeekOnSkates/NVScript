/**
 * This takes the raw data from script files, checks for errors,
 * and sets up the stuff the interpreter will need to run the code.
 */
class Parser
{
    /**
     * Parses the raw data into a format the program can use
     * @param[in] The filename
     */
    ParseFile(file)
    {
        ; Read the file into memory
        FileRead, data, %file%

        ; Remove comments
        data := RegExReplace(data, ";.{0,}\r\n", "`r`n")

        ; Now we have just the code to work with, so we can check for syntax errors
    }
}