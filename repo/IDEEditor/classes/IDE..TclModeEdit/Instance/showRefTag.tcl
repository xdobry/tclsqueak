IDE::TclModeEdit instproc showRefTag ctag {
    my instvar refArr
    set ref $refArr($ctag)
    set refType [lindex $ref 0]
    if {$refType eq "object"} {
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject [lindex $ref 1]]
        if {$introProxy ne "" && [$introProxy isObjectClass [lindex $ref 1]]} {
            IDE::HeritageBrowser newBrowser [lindex $ref 1] $introProxy
        }
    } elseif {$refType eq "method" && [llength [lindex $ref 1]]>0} {
        set b ""
        if {![my hasModifications]} {
            set p [my info parent]
            if {[$p hasclass IDE::CompBrowser]} {
                set b $p
            }
        }
        if {$b eq ""} {
            set b [IDE::CompBrowser newBrowser]
        }
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject [lindex $ref 1 0]]
        set class [string trimleft [lindex $ref 1 0] :]
        set type [expr {[lindex $ref 1 1] eq "instproc" ? "Instance" : "Class"}]
        set method [lindex $ref 1 2]
        ${b}::methodview selectHItemGlobal [list $class [$introProxy getOOSystemPrefix]$type $method]
    }

}
