#include %A_ScriptDir%\parser.ahk

file := A_ScriptDir . "\HelloWorld.nvs"
p := new Parser()
p.ParseFile(file)

return      ; End of auto-run section

F5::Reload