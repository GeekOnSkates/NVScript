; NOTE: All the built-in functions will take one parameter, the parameters that appear in the script file

SayString(params)
{
    ; Validate parameters
    if (!params[1])
    {
        MsgBox Error: SayString needs at least one parameter, a non-blank string.
        return
    }

    ; Use the NVDA controller DLL to speak
    if (trim(params[2]) == "true")
        NVDA.CancelSpeech()
    NVDA.Say(params[1])
}