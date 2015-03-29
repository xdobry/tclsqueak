IDE::RegexpBrowser instproc unredo:regexp dir {
    my instvar data

    set index [expr ($data(v:undo:index)+$dir) % 100]
    if {![info exists data(v:undo:r$index)]} {
        return
    }
    set data(v:undo:index) $index

    set t $data(w:regexp)
    $t delete 1.0 end
    $t insert 1.0 [lindex $data(v:undo:r$index) 1]
    $t mark set insert [lindex $data(v:undo:r$index) 0]
}
