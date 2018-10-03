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