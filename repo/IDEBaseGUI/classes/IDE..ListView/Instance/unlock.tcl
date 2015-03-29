IDE::ListView instproc unlock {} {
    if {[info exists [self]::lock]} {
        set [self]::lock 0
        my set lock_on {}
    }
}
