PrsElement instproc getParser {} {
    #ttc rettype xotcl ::TclParser
    set i [self]
    while {[Object isobject $i] && ![$i hasclass TclParser]} {
        set i [$i info parent]
    }
    return $i
}
