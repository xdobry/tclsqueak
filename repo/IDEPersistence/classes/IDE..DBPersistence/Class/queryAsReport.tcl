IDE::DBPersistence proc queryAsReport statement {
    set query [[my getConnection] query $statement]
    set ret {}
    set row [$query fetch]
    while {[llength $row]>0} {
        append ret $row\n
        set row [$query fetch]
    }
    $query destroy
    return $ret
}
