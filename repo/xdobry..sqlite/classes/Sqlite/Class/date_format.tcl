Sqlite proc date_format {date format} {
   if {$date eq ""} {
        return
    } elseif {[string length $date] == 14} {
        set date "[string range $date 0 7] [string range $date 8 13]"
    }
    clock format [clock scan $date] -format $format
}
