ORATcl instproc getTimeValue time {
    if {[string first 0000-00-00 $time]} {
        return NULL
    }
    # Oracle accept only platfomr format
    # we suppose that we have us format 
    # also cut last digits
    regexp {.*\d\d:\d\d:\d\d} $time time
    return "to_timestamp('$time','YYYY-MON-DD HH:MI:SS')"
}
