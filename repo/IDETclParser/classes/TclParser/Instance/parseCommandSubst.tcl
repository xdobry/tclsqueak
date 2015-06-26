TclParser instproc parseCommandSubst {} {
    my instvar stream
    set open 0
    set parseQuote 1
    set startPos [$stream pos]
    # search closing parenthesis until and of stream
    while {![$stream atEnd]} {
        set c [my getCharWithMasking]
        switch -- $c {
            \[ {
                incr open
            }
            \] {
                incr open -1
                if {$open==0} {
                    return 1
                }
            }
            \{ {
                my parseNoSubst
            }
            \" {
                if {$parseQuote} {
                    $stream addPos 1
                    my parseQuote
                }
            }
        }
        set parseQuote [string is space $c]
        $stream addPos [string length $c]
    }
    my parseError "Parse Error: can not find closing \]" $startPos
}
