; FileExists (string filename)
FileExists(params)
{
    ; Validate parameters
    if (!params[1])
    {
        MsgBox Error: FileExists needs at least one parameter, a non-blank string.
        return
    }

    ; AHK's FileExist function doesn't return boolean,
    ; which is why I'm doing it like this.
    if (FileExist(params[1]))
        return true
    else
        return false
}