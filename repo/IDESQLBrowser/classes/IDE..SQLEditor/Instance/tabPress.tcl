IDE::SQLEditor instproc tabPress {} {
    set twin [my getTextWindow]
    set insert [$twin index insert]
    set start [$twin index "$insert - 1 c wordstart"]
    set res [$twin get $start $insert]
    if {[regexp {[\w\$]+} $res]} {
       set pattern ${res}*
       if {$start eq "1.0"} {
           set reservedwords [list select update delete insert]
       } else {
           set reservedwords [list where from having {group by} {order by}]
       }
       set words [lsearch -inline -all [concat $reservedwords [my getAllWords]] $pattern]
       my invokePopDown $words $pattern
    } else {
       my appendToCursor {    }
    }
    return -code break 
}
