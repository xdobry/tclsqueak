MySql instproc execute sqlstatement {
    my instvar handle
    if {[catch {set ret [mysqlexec $handle $sqlstatement]} err]} {
        my errorMessage $err
        return
    }
    return $ret
}
