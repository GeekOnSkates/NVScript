; SayString (string text, bool interrupt)
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

; StopSpeech()
StopSpeech()
{
    NVDA.CancelSpeech()
}