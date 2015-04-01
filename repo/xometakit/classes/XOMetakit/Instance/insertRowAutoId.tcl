XOMetakit instproc insertRowAutoId {table columns values {primarykey {}} {sequenzer {}}} {
    my instvar handle
    set row [list]
    foreach c $columns v $values {
        lappend row $c $v
    }
    set rid [eval mk::row append $handle.$table $row]
    my commit
    set last [expr {[string last ! $rid]+1}]
    string range $rid $last end
}
