TclParser instproc getList parent {
    my instvar stream
    my skipSeparators
    set char [my getCharWithMasking]

    switch -exact -- $char {
         \{ {
            return [my getNoSubst $parent]
        }
        \" {
            set quote [PrsQuoted new -childof $parent -begin [$stream pos] -hasQuote 1]
            $stream addPos 1
            my skipUpTo \"
            $quote end [$stream pos]
            $stream addPos 1
            return $quote
        }
        default {
            set literal [PrsLiteral new -childof $parent -begin [$stream pos]]
            my skipUpToCharacters "\t \n"
            $literal end [expr {[$stream pos]-1}]
            $stream addPos 1
            return $literal
        }
    }
}
