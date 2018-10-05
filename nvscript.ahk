#include %A_ScriptDir%\parser.ahk
#include %A_ScriptDir%\Script.ahk
#include %A_ScriptDir%\NVDA.ahk
#include %A_ScriptDir%\builtin\dll_functions.ahk
#include %A_ScriptDir%\builtin\keyboard_functions.ahk
#include %A_ScriptDir%\builtin\mouse_functions.ahk
#include %A_ScriptDir%\builtin\file_functions.ahk
#include %A_ScriptDir%\builtin\win32_functions.ahk
#include %A_ScriptDir%\builtin\string_functions.ahk

file := A_ScriptDir . "\HelloWorld.nvs"
p := new Parser()
p.ParseFile(file)

return      ; End of auto-run section

F5::Reload