TclParser instproc parseQuote {} {
    my instvar stream
    set startPos [$stream pos]
    if {$startPos>0} {
        incr startPos -1
    }
    while {![$stream atEnd]} {
        set c [my getCharWithMasking]
        switch -- $c {
            \" {
                return 1
            }
            \[ {
                my parseCommandSubst
            }
        }
        $stream addPos [string length $c]
    }
    my parseError "Parse Error: can not find closing \"" $startPos
}
