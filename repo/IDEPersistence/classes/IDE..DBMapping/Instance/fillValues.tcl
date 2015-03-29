IDE::DBMapping instproc fillValues {object values} {
    my instvar columns
    foreach col $columns value $values {
        if {[llength $col]>3} {
            set method [lindex $col 3]
            if {$method ne "_"} {
                $object $method $value
            }
        } else {
            $object set [lindex $col 0] $value
        }
    }
}
