TclParser instproc substituteTo parent {
    my instvar stream
    my skipBlanks
    while {![$stream atEnd]} {
        set char [my getCharWithMasking]
        switch -- $char {
            \[ {
                $parent addElem [my getCommandSubst $parent]
                continue
            }
            \$ {
                set obj [my getVariable $parent]
                if {$obj ne ""} {
                    $parent addElem $obj
                } else {
                    $stream addPos [string length $char]
                }
                continue
            }
        }
        $stream addPos [string length $char]
    }
}
