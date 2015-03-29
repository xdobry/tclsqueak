TclParser instproc getCommand parent {
    my instvar stream
    set command [PrsCommand new -childof $parent -begin [$stream pos]]
    while 1 {
        $command addElem [my getArg $command]
        my skipSeparators
        set char [$stream getChar]
        if {[$stream atEnd] || $char eq "\n"} {
            $command end [expr {[$stream pos]-1}]
            return $command
        }
        if {$char eq ";"} {
            $command end [expr {[$stream pos]-1}]
            $stream addPos 1
            return $command
        }
    }
}
