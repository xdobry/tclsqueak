IDE::ListView instproc has_lock {} {
    return [expr {[info exists [self]::lock] && [set [self]::lock]}]
}
