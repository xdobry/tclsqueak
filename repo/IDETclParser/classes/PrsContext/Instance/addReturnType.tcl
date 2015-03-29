PrsContext instproc addReturnType type {
    my instvar returnTypes
    if {![info exists returnTypes]} {
        set returnTypes [list]
    }
    if {$type ni $returnTypes} {
        lappend returnTypes $type
    }
}
