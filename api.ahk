; NOTE: All the built-in functions will take one parameter, the parameters that appear in the script file.
; Each function shows its function signature in NVScript.

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

; ClickAtPoint(int x, int y)
ClickAtPoint(params)
{
    x := params[1]
    y := params[2]
    if x is not integer
    {
        MsgBox Error: Invalid first parameter "%x%" in function ClickAtPoint (should be a whole number)
        return
    }
    if y is not integer
    {
        MsgBox Error: Invalid second parameter "%y%" in function ClickAtPoint (should be a whole number)
        return
    }

    ; And click
    CoordMode, Mouse, Screen
    Click, %x%, %y%
}