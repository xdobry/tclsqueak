TclParser instproc getBeginingCommandSubst parent {
    my instvar stream
    set begin [$stream pos]
    my parseCommandSubst
    set end [$stream pos]
    $stream addPos 1
    set char [$stream getChar]
    if {[my isEndList]} {
        set commandsubst [PrsCommandSubst new -childof $parent -begin $begin -end $end]
        $commandsubst evalContents
        return $commandsubst
    } else {
        set quote [PrsQuoted new -childof $parent -begin $begin]
        set commandsubst [PrsCommandSubst new -childof $quote -begin $begin -end $end]
        $commandsubst evalContents
        $quote addElem $commandsubst
        while {![my isEndList]} {
            switch -- $char {
                \$ {
                    set var [my getVariable $quote]
                    if {$var ne ""} {
                        $quote addElem $var
                    } else {
                        $stream addPos 1
                    }
                }
                \[ {
                    $quote addElem [my getCommandSubst $quote]
                }
            }
            my skipUpToCharacters ";\[\$\t \n"
            set char [$stream getChar]
        }
        $quote end [expr {[$stream pos]-1}]
        return $quote
    }
}
