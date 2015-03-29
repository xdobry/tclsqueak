IDE::FileBrowser instproc refreshFiles {{updatehistory 1}} {
    my instvar currentDic win history historyIndex
    if {$updatehistory &&  [lindex $history $historyIndex] ne $currentDic} {
        incr historyIndex
        set history [linsert $history $historyIndex $currentDic]
    }                
    $win.current configure -text $currentDic
    set dirs [list]
    foreach f [glob -nocomplain -directory $currentDic -types d *] {
        lappend dirs [file tail $f]
    }
    [self]::@directories setList $dirs
    set files [list]
    foreach f [glob -nocomplain -directory $currentDic *] {
        lappend files [file tail $f]
    }
    set files [lsort $files]
    [self]::@files setListUnsorted $files
    foreach d $dirs {
        [self]::@files markItemIndexForeGround [lsearch $files $d] blue
    }
    set m [list]
    if {[my exists mountsTo]} {
        set m [my set mountsTo]
    }
    [self]::@volumes setListUnsorted [concat [lsort [file volumes]] $m]
}
