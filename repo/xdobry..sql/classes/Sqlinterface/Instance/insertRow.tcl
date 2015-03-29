Sqlinterface instproc insertRow {table columns values {types {}}} {
    set vals {}
    foreach val $values type $types {
        if {$vals ne ""} {append vals ,}
        if {$val eq "NULL" || $val eq [my getTimeStampFunction]} {
            append vals $val
        } else {
            append vals [my getMaskedValue $val $type]
        }
    }
    set mcolumns [list]
    foreach c $columns {
        lappend mcolumns [my maskColumnName $c]
    }
    my execute "INSERT INTO [my maskTableName $table] ([join $mcolumns ,]) VALUES ($vals)"
}
