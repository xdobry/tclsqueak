Tcl2HTML instproc prepareOutDir {} {
    my instvar outDir
    if {![info exists outDir]} {
        set outDir ""
        return
    }
    set rooDir [PrsCheckerOptions getRootDir]

    foreach f {tcl2html.css jquery-1.5.1.js tclhtml-files.js tclhtml-file.js tclhtml-sig.js tclhtml-index.js index.html} {
        file copy -force [file join $rooDir ttclcheck-res $f] [file join $outDir $f]
    }
    file mkdir [file join $outDir images]
    foreach f [glob -directory [file join $rooDir images] *] {
        file copy -force $f [file join $outDir images [file tail $f]]
    }
}
