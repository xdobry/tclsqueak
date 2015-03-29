IDE::PackageLoader instproc selectPackage package {
    my set selectedPackage $package
    set versions [list]
    foreach v [package versions $package] {
        set script [package ifneeded $package $v]
        set vw [list]
        lappend vw $v
	set nolist [catch {lindex $script 0}]
        if {!$nolist && [lindex $script 0] eq "source"} {
            lappend vw Tcl [lindex $script 1]
        } elseif {!$nolist && [lindex $script 0] eq "load"} {
            lappend vw Binary [lindex $script 1]
        } else {
            lappend vw Unknown
        }
        lappend versions $vw
    }
    my @versions setListUnsorted $versions
    my unselectState
}
