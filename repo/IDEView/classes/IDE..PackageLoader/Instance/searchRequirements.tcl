IDE::PackageLoader instproc searchRequirements {} {
    set item [my @versions selectedItem]
    if {$item eq "" || [llength $item]<3 || [lindex $item 1] ne "Tcl"} return
    set file [lindex $item 2]
    set f [open $file r]
    set rPackages [list]
    while {[gets $f line]>=0} {
        if {[regexp {package require\s+(\w+)} $line _ pack]} {
            lappend rPackages $pack
        }
    }
    close $f
    IDE::ResultBrowser newBrowser [join [lsort -unique $rPackages] \n]
}
