TclParser instproc getComment parent {
    my instvar stream
    set begin [$stream pos]
    my skipUpTo \n
    PrsComment new -childof $parent -begin $begin -end [expr {[$stream pos]-1}]
}
