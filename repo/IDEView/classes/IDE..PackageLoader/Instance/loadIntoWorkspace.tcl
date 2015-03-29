IDE::PackageLoader instproc loadIntoWorkspace {} {
    set item [my @versions selectedItem]
    if {$item eq "" || [llength $item]<3 || [lindex $item 1] ne "Tcl"} return
    IDE::Transcript openFile [lindex $item 2]    
}
