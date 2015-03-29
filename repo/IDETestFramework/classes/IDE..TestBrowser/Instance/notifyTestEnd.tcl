IDE::TestBrowser instproc notifyTestEnd event {
    my instvar win testRef
    set id [dict get $testRef [dict get $event class] [dict get $event method] id]
    $win.tree item $id -values [list [dict get $event status] [dict get $event time]] -tag [dict get $event status]
    dict set testRef [dict get $event class] [dict get $event method] result $event
    update
}
