ODBC instproc getconnectargs {} {
    list [list datasource list {} [my getSources]] {user text {}} {password password {}}
}
