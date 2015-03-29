MySql instproc getconnectargs {} {
    global env
    if {[info exists env(USERNAME)]} {
        set user $env(USERNAME)
    } else {
        set user ""
    }
    return [list  {hostname text localhost}  {socket text {}}  {port integer 3306}  [list user text $user]  {password password {}}  {dbank text {}}
            ]
           
}
