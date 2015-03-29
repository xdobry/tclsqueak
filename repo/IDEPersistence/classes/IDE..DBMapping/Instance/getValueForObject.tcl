IDE::DBMapping instproc getValueForObject {object column} {
    my instvar columns
    foreach c $columns {
        if {[lindex $c 0]==$column} {
            if {[llength $c]>=3 && [lindex $c 2] ne ""} {
                set method [lindex $c 2]
                if {$method ne "_"} {
                    return [$object $method]
                }
            } else {
                set variable [lindex $c 0]
                if {[$object exists $variable]} {
                    return [$object set $variable]
                }
            }
        }
    }
    return
}
