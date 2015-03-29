IDE::VersionView instproc selectItem item {
    my instvar idList
    set index [lindex [my selectedIndex] 0]
    if {$index eq ""} return
    set id [lindex $idList $index]
    [my info parent]::additional setText [[my getVObject] getAdditionalInfo $id]
}
