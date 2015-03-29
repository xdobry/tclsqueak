IDE::Component instproc getRequiredFromDeep {} {
    my instvar requiredComp
    set reqlist [my getRequiredFrom]
    set oreqlist [list]
    foreach req $reqlist {
        if {$req ni $oreqlist} {
            if {[set scomp [IDE::Component getCompObjectForNameIfExist $req]] ne ""} {
                set sreqlist [$scomp getRequiredFromDeep]
                foreach sreq $sreqlist {
                    ide::lappendIfNone oreqlist $sreq
                }
                lappend oreqlist $req
            } else {
                lappend oreqlist {*}$req
            }
        }
    }
    return $oreqlist
}
