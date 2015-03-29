IDE::TestBrowser instproc notifyClassEnd class {
    my instvar win testRef
    set time 0
    set status ok
    set id [dict get $testRef $class _root id]

    dict keys [dict get $testRef $class]
    dict for {key value} [dict get $testRef $class] {
         if {$key ne "_root"} {
             if {[dict exists $testRef $class $key result]} {
                 set result [dict get $testRef $class $key result]
                 incr time [dict get $result time]
                 if {[dict get $result status] ne "ok"} {
                     set status error
                 }
             }
         }
    }
    $win.tree item $id -values [list $status $time] -tag $status
    update
}
