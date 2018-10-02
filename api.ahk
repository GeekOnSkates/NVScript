; NOTE: All the built-in functions will take one parameter, the parameters that appear in the script file

SayString(params)
{
    ; For now, just loop through "params"
    Loop % params.MaxIndex()
        MsgBox % params[A_Index] . "  !!!"
}