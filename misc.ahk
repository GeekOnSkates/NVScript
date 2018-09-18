/**
 * Checks if a string starts with a substring
 * @param[in] The string to search in
 * @param[in] The string to search for
 * @return True if string A starts with B, false otherwise
 */
StringStartsWith(haystack, needle)
{
    return SubStr(haystack, 1, StrLen(needle)) == needle
}