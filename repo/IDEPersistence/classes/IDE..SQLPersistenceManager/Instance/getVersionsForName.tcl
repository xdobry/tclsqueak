IDE::SQLPersistenceManager instproc getVersionsForName {name cols desc {descorder 1}} {
    set sqlcols [list]
    set hasuser 0
    foreach c $cols {
        if {$c eq "timest"} {
            lappend sqlcols [[my getConnection] dateFormat o.$c]
        } elseif {$c eq "username"} {
            lappend sqlcols u.name
            set hasuser 1
        } else {
            lappend sqlcols o.$c
        }

    }
    set sqlcols [join $sqlcols ,]
    if {$descorder} {
        set order " desc"
    } else {
        set order ""
    }
    if {$hasuser} {
        set sql "SELECT $sqlcols FROM [$desc table] o,Userlib u WHERE o.name='$name' AND u.userid=o.userid ORDER BY o.[$desc idColumn] $order"
    } else {
        set sql "SELECT $sqlcols FROM [$desc table] o WHERE name='$name' ORDER BY [$desc idColumn] $order"
    }
    [my getConnection] queryList $sql
}
