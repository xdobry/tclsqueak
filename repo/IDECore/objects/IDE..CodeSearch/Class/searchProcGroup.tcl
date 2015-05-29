IDE::CodeSearch proc searchProcGroup {procGroup searchDict} {
    set type [dict get $searchDict type]
    set list [list]
    if {$type eq "implementors"} {
        set procNames [$procGroup getProcsNames]
        set implementor [dict get $searchDict text]
        if {$implementor in $procNames} {
            lappend list "proc $implementor"
        }
        if {[string first :: $implementor]<0} {
            foreach pName $procNames {
                if {[namespace tail $pName] eq $implementor} {
                    lappend list "proc $pName"
                }
            }
        }
    } else {
        set introProxy [$procGroup getIntroProxy]
        foreach proc [$procGroup getProcsNames] {
            if {[my searchText [$introProxy getBodyPartForTextSearch [$introProxy getProcBody $proc]] $searchDict]} {
                lappend list "proc $proc"
            }
        }
    }
    return $list
}
