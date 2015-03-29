IDEStarter proc getConnectionObject {} {
    set interface [IDEPreferences getParameter interface]
    if {$interface eq ""} return
    set iclass [Sqlinterface loadInterface $interface]
    return [$iclass new]
}
