IDE::SQLPersistenceManager instproc selectAsListWithId {table cols columnId columnName columnValue {orderby {}}} {
    set order ""
    if {$orderby ne ""} {
        set order "ORDER BY $orderby"
    }
    if {$columnName eq ""} {
        set where ""
    } else {
        set where "WHERE $columnName='$columnValue'"
    }
    [my getConnection] queryList "SELECT $columnId,[join $cols ,] FROM $table $where $order"
}
