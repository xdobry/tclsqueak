IDE::Component proc orderComponents comps {
    set cobjs [ide::lcollect each $comps {my getCompObjectForNameIfExist $each}]
    set outList [list]
    foreach cobj $cobjs {
        set name [$cobj getName]
        if {$name in $outList} continue
        foreach rcomp [$cobj getRequiredFromDeep] {
            if {$rcomp in $comps} {
                ide::lappendIfNone outList $rcomp
            }
        }
        lappend outList $name
    }
    return $outList
}
