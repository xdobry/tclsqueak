IDE::TestBrowser instproc getSelectedClassMethod {} {
    my instvar win idArr testRef
    set items [$win.tree selection]
    if {[llength $items]==0} return
    set id [lindex $items 0]
    if {[info exists idArr($id)]} {
        return $idArr($id)
    } else {
        return [list [$win.tree item $id -text]]
    }
}
