Sqlite::SqlQuery instproc fetch {} {
    set position [my set position]
    if { $position < [my rows] } {
        my incr position
        return [lindex [my set result] $position]
    } else {
        return
    }
}
