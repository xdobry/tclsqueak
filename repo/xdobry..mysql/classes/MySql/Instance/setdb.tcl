MySql instproc setdb dbname {
    my instvar handle dbank
    if {[catch {mysqluse $handle $dbname} err]!=0} {
        global errorInfo
        puts "$err $errorInfo"
        set dbank {}
        return
    }
    set dbank $dbname
}
