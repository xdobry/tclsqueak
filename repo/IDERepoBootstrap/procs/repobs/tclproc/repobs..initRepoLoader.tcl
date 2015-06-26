proc repobs::initRepoLoader repofile {
    if {![file isfile $repofile]} {
        puts "repofile $repofile is not a file"
        return
    }
    package require XOTcl
    package require xdobry::sql
    package require xdobry::sqlite
    package require IDEStart
    Sqlinterface loadInterface sqlite
    set connection [Sqlite new]
    if {[$connection connect [list sqlfile $repofile]]} {
        error "can not open sqlite $repofile $::errorInfo"
    }
    $connection execute "PRAGMA journal_mode = OFF"
    IDEStarter set sqlhandle $connection
    IDEStarter set isDevelopingMode 0
    puts "initialized repo loader from $repofile"
}
