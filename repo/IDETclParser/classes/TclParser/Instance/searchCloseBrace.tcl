TclParser instproc searchCloseBrace {obrace cbrace} {
    my instvar stream
    set open 0
    # search closing parenthesis until and of stream
    while {![$stream atEnd]} {
        set c [my getCharWithMasking]
        if {$c eq $obrace} {
            incr open
        } elseif {$c eq $cbrace} {
            incr open -1
            if {$open==0} {
                return 1
            }
        }
        $stream addPos [string length $c]
    }
    my parseError "Parse Error: can not find closing $cbrace"
}
