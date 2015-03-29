POTHelper instproc scanAllXdobry {} {
    foreach com [IDE::Component getComponentNames] {
        if {![string match xdobry::* $com]} continue
        my scanComponent $com
    }
}
