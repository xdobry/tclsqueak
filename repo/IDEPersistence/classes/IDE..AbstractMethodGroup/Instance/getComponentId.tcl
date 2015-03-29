IDE::AbstractMethodGroup instproc getComponentId {} {
    set cobj [my getComponent]
    if {[$cobj exists componentid]} {
        return [$cobj set componentid]
    }
    return
}
