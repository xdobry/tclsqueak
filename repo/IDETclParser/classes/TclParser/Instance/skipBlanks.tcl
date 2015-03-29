TclParser instproc skipBlanks {} {
    my instvar stream
    set char [my getCharWithMasking]
    while {![$stream atEnd] && ([string is control $char] || [string is space $char] || $char eq "\\\n")} {
        $stream addPos [string length $char]
        set char [my getCharWithMasking]
    }
}
