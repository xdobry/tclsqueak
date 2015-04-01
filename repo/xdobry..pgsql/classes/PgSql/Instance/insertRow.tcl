PgSql instproc insertRow {table columns values {types {}}} {
    # postgres do not support [] syntax for enabling spaces in table name
    # postgres do not accept 0,1 as boolean values
    # we need to convert to false, true
    if {[lsearch $types boolean]>=0} {
        set cvalues [list]
        foreach v $values t $types {
            if {$t eq "boolean"} {
                if {$v} {
                    lappend cvalues true
                } else {
                    lappend cvalues false
                }
            } else {
                lappend cvalues $v
            }
        }
    } else {
        set cvalues $values
    }
    next $table $columns $cvalues $types
}
