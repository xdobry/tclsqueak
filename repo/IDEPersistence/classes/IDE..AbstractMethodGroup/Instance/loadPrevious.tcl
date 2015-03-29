IDE::AbstractMethodGroup instproc loadPrevious {} {
    my instvar basedon
    if {![info exists basedon] || $basedon eq "" || $basedon==0} {
        IDE::Dialog message "The object has no previous version. It is initial version"
        return
    }
    my changeVersionTo $basedon
}
