IDE::TestBrowser instproc selectTest {} {
    my instvar testRef
    lassign [my getSelectedClassMethod] class method
    if {![dict exists $testRef $class $method result]} {
        return
    }
    set result [dict get $testRef $class $method result]
    if {[dict exists $result error]} {
        my @errormessage setText [dict get $result error]
    } else {
        my @errormessage setText ""
    }
    
}
