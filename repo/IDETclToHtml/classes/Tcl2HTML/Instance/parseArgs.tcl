Tcl2HTML instproc parseArgs arguments {
    set elem [lindex $arguments 0]
    if {$elem eq "-od"} {
        if {[llength $arguments]<2} {
            error "expect argument for option -od"
        }
        set outDir [lindex $arguments 1]
        if {![file isdir $outDir]} {
            file mkdir $outDir
        }
        my set outDir $outDir
        return 2
    } elseif {$elem eq "-noerror"} {
        my set noerror 1
        return 1
    }
    return 0
}
