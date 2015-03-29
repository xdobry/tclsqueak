Sqlite instproc disconnect {} {
    if {[my exists connected] && [my set connected]} {
        [my set sqlhandle] close
        my unset sqlhandle
        my set connected 0
    }
}
