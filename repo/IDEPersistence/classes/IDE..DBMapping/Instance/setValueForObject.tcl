IDE::DBMapping instproc setValueForObject {object column value} {
    my instvar columns
    foreach c $columns {
        if {[lindex $c 0]==$column} {
            if {[llength $c]>=4 && [lindex $c 3] ne ""} {
                set method [lindex $c 3]
                if {$method ne "_"} {
                    return [$object $method $value]
                }
            } else {
                return [$object set [lindex $c 0] $value]
            }
        }
    }
    return
}
