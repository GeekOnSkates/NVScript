#include %A_ScriptDir%\parser.ahk
#include %A_ScriptDir%\Script.ahk
#include %A_ScriptDir%\NVDA.ahk
#include %A_ScriptDir%\api.ahk

file := A_ScriptDir . "\HelloWorld.nvs"
p := new Parser()
p.ParseFile(file)

return      ; End of auto-run section

F5::Reload