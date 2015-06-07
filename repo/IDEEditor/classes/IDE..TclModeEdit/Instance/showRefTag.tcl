IDE::TclModeEdit instproc showRefTag ctag {
    my instvar refArr
    set ref $refArr($ctag)
    set refType [lindex $ref 0]
    if {$refType eq "object"} {
        set object [lindex $ref 1]
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
        if {$introProxy ne "" && [$introProxy isObjectClass $object]} {
            [my getViewMaster] showHierarchy $object $introProxy heritage
        }
    } elseif {$refType eq "method" && [llength [lindex $ref 1]]>0} {
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject [lindex $ref 1 0]]
        set class [string trimleft [lindex $ref 1 0] :]
        set type [expr {[lindex $ref 1 1] eq "instproc" ? "Instance" : "Class"}]
        set method [lindex $ref 1 2]
        [my getViewMaster] refreshHItem [list $class [$introProxy getSpecialMethodType $type] $method]
    }

}
