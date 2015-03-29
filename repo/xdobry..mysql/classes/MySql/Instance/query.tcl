MySql instproc query sqlstatment {
    my instvar handle
    if {[catch {set qhandle [mysqlquery $handle $sqlstatment]} err]} {
        my errorMessage $err
        return
    }
    set rows [mysqlresult $qhandle rows]
    return [MySql::SqlQuery new -childof [self] -qhandle $qhandle -frows $rows]
}
