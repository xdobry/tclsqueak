IDE::SQLPersistenceManager instproc selectExact {table cols columnName columnValue} {
    set query [[my getConnection] query "select [join $cols ,] from $table where $columnName=$columnValue"]
    set result [$query fetch]
    $query destroy
    return $result
}
