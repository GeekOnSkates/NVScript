/**
 * This takes the code returned by the parser and interprets it for
 * scripts, which are different from functions (no return value etc.)
 */
class Script
{
    /**
     * Constructor - run the script or set a hockey to run the script
     * @param {string} data The data from the parser
     */
    __new(data)
    {
        Loop % data.MaxIndex()
        {
            line := data[A_Index]
            if (A_Index > 1)
                parser.CallFunction(line)
        }
    }
}