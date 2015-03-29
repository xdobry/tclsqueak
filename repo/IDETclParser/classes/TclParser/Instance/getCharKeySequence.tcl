TclParser instproc getCharKeySequence parent {
    my instvar stream
    set begin [$stream pos]
    my skipUpToCharacters ";\[\$\t \n)"
    set char [$stream getChar]
    if {[my isEndList]} {
        set charseq [PrsLiteral new -childof $parent -begin $begin]
        $charseq end [expr {[$stream pos]-1}]
        return $charseq
    } else {
        set quote [PrsQuoted new -childof $parent -begin $begin]
        while {![my isEndList]} {
            switch -- $char {
                \$ {
                    set var [my getVariable $quote]
                    if {$var ne ""} {
                        $quote addElem $var
                    }  else {
                        $stream addPos 1
                    }
                }
                \[ {
                    $quote addElem [my getCommandSubst $quote]
                }
            }
            my skipUpToCharacters ";\[\$\t \n)"
            set char [$stream getChar]
        }
        $quote end [expr {[$stream pos]-1}]
        return $quote
    }

}
