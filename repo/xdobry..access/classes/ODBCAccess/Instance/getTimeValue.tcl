ODBCAccess instproc getTimeValue time {
    if {[string first 0000-00-00 $time]>0} {
        return NULL
    }
    # Access do not accept Time Format 00:00:00.000
    # also cut last digits
    set ret [regsub {(.*\d\d:\d\d:\d\d).\d+} $time {\1}]
    return '$ret'
}
