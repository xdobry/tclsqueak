TclParser instproc skipCharacters string {
    my instvar stream
    set char [my getCharWithMasking]
    while {![$stream atEnd] && [string first $char $string]!=-1} {
        $stream addPos [string length $char]
        set char [$stream getChar]
    }
}
