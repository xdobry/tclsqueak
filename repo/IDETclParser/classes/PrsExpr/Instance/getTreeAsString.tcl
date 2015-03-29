PrsExpr instproc getTreeAsString {{tree {}}} {
    my instvar exprTree
    if {$tree eq ""} {
        set tree $exprTree
    }
    if {[llength $tree]==1} {
        return [[lindex $tree 0] prsString]
    } else {
        set ret "op='[[lindex $tree 0] prsString]' ("
        set first 1
        foreach v [lrange $tree 1 end] {
            if {!$first} {
                append ret ,
            }
            append ret [my getTreeAsString $v]
            set first 0
        }
        append ret ")"
        return $ret
    }

}
