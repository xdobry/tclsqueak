MySql instproc createDatabase dbname {
    if {[my execute "CREATE DATABASE $dbname"] eq ""} {return 0}
    if {[my setdb $dbname] eq ""} {return 0}
    return 1
}
