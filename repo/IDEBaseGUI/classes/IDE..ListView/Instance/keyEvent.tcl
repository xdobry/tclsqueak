IDE::ListView instproc keyEvent key {
    my instvar listItems
    if {$key eq "" || [string is control $key]} return
    set sindex [lsearch -glob -regexp $listItems (?i)^$key]
    if {$sindex>=0} {
        my setSelectedIndex $sindex
    }
}
