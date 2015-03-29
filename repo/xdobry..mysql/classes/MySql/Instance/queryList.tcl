MySql instproc queryList sqlstatement {
    my instvar handle
    if {[catch {set ret [mysqlsel $handle $sqlstatement -list]} err]} {
        my errorMessage $err
        return
    }
    return $ret
}
