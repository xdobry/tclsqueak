TclExprParser instproc getOpValue op {
    if {[$op exists op]} {
        return [$op set op]
    }
    $op prsString
}
