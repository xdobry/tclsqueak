ODBCMSSql instproc getinsertid {} {
    lindex [lindex [my queryList {select @@IDENTITY}] 0] 0
}
