TclParser instproc getArrayKey parent {
    my instvar stream terminalChar
    if {[$stream getChar] ne "("} return
    $stream addPos 1
    set char [$stream getChar]
    set oldTerminalChar $terminalChar
    set terminalChar )
    switch -- $char {
        \[ {
            set key [my getBeginingCommandSubst $parent]
        }
        \$ {
            set key [my getBeginingVariable $parent 1]
            if {$key eq ""} {
                set key [my getCharKeySequence $parent]
            }
        }
        default {
            set key [my getCharKeySequence $parent]
        }
    }
    set terminalChar $oldTerminalChar
    if {[$stream atEnd] || [$stream getChar] ne ")"} {
        #my halt
        my parseError "Can not parse array key"
        return
    }
    $parent set key $key
    $stream addPos 1
}
