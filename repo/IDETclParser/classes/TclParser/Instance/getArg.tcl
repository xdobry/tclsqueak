TclParser instproc getArg parent {
    my instvar stream
    my skipSeparators
    set char [$stream getChar]
    switch -exact -- $char {
        \[ {
            return [my getBeginingCommandSubst $parent]
        }
        \{ {
            if {[$parent hasclass PrsCommand] && [regexp {^{\*}\S$} [$stream getFromCurrent 4]]} {
                set argumentExpansion [PrsArgumentExpansion new -childof $parent -begin [$stream pos]]
                $stream addPos 3
                set elem [my getArg $argumentExpansion]
                $argumentExpansion end [$elem end]
                $argumentExpansion addElem $elem
                return $argumentExpansion
            } else {
                return [my getNoSubst $parent]
            }
        }
        \" {
            return [my getQuoted $parent]
        }
        \$ {
            # TODO if non \w after $ then $ is common character
            set var [my getBeginingVariable $parent]
            if {$var eq ""} {
                return [my getCharSequence $parent]
            } else {
                return $var
            }
        }
        default {
            return [my getCharSequence $parent]
        }
    }
}
