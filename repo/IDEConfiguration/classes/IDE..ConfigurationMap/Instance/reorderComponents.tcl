IDE::ConfigurationMap instproc reorderComponents {} {
    # !!! todo
    set cobjs [my getComponents]
    set comps {}
    foreach c $cobjs {
        lappend comps [$c name]
        set compsArr([$c name]) $c
    }
    set outList {}
    set outComps {}
    foreach cobj $cobjs {
        set name [$cobj getName]
        if {[ide::lcontain $outList $name]} continue
        foreach rcomp [$cobj getRequirements] {
            if {[ide::lcontain $comps $rcomp]} {
                ide::lappendIfNone outList $rcomp 
                ide::lappendIfNone outComps $compsArr($rcomp)
            }
        }
        lappend outList $name
        lappend outComps $cobj
    }
    if {$cobjs!=$outComps} {
        my setComponents $outComps
        return 1 
    }
    return 0
}
