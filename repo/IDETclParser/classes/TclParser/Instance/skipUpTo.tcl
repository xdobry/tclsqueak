TclParser instproc skipUpTo echar {
    my instvar stream
    set char [my getCharWithMasking]
    while {![$stream atEnd] && $char ne $echar} {
        $stream addPos [string length $char]
        set char [my getCharWithMasking]
    }
}
