IDE::MethodEditSynchronizatorMix instproc registerKeyForInstance key {
    IDE::MethodEditSynchronizatorMix instvar synchArr synchEditors
    set instance [self]
    if {[info exists synchEditors($instance)]} {
        set okey $synchEditors($instance)
        if {$okey ne $key} {
            set current $synchArr($okey)
            ide::lremove current $instance
            if {[llength $current]==0} {
                unset synchArr($okey)
            } else {
                set synchArr($okey) $current
            }
        }
    }
    set synchEditors($instance) $key

    if {[info exists synchArr($key)]} {
        set current $synchArr($key)
        lappend current $instance
        set synchArr($key) [lsort -unique $current]
    } else {
        set synchArr($key) $instance
    }
}
