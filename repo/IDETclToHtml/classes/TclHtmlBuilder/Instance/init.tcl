TclHtmlBuilder instproc init {outDir _fileName} {
    my instvar rootBackReference fileName
    set fileName $_fileName
    set deep [expr {[llength [file split $fileName]]-1}]
    if {$deep>=1} {
        set rootBackReference [file join {*}[lrepeat $deep ..]]
    } else {
        set rootBackReference ""
    }
    if {$outDir ne ""} {
        set fullFileName [file join $outDir $fileName]
        set parent [file dirname $fullFileName]
        if {$parent ne "" && ![file isdirectory $parent]} {
            file mkdir $parent
        }
    } else {
        set rootBackReference ""
        set fullFileName $fileName
    }
    my  openFile $fullFileName
}
