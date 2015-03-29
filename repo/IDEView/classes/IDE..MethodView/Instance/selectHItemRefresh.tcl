IDE::MethodView instproc selectHItemRefresh hitem {
    set parent [my info parent]
    if {$parent ne "" && [$parent info methods refreshHItem] ne ""} {
        $parent refreshHItem $hitem
    }
    my set actItem $hitem
    my refreshView
    my setSelectedItem [lindex $hitem end] 0
}
