IDE::SQLPersistenceManager instproc selectAsList {table cols columnName columnValue {orderby {}}} {
    set order ""
    if {$orderby ne ""} {
        set order "ORDER BY $orderby"
    }
    [my getConnection] queryList "SELECT [join $cols ,] FROM $table WHERE $columnName=$columnValue $order"
}
