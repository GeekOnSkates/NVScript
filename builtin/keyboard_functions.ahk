; ControlEnterKey()
ControlEnterKey()
{
    SendInput {ctrl down}{enter}{ctrl up}
}

; ControlShiftEnterKey()
ControlShiftEnterKey()
{
    SendInput {ctrl down}{shift down}{enter}{shift up}{ctrl up}
}