IDE::VersionView instproc selectFor name {
    my instvar idList
    set vobject [my getVObject]
    set vlist {}
    set idList {}
    set loadedId [$vobject getLoadedVersionForName $name]
    set markItem {}
    foreach row [$vobject getVersionsForName $name] {
        lappend idList [lindex $row 0]
        set listItem [join [lrange $row 1 end] -]
        if {$loadedId==[lindex $row 0]} {
            set markItem $listItem
        }
        lappend vlist $listItem
    }
    my setListUnsorted $vlist
    my unselect
    if {$markItem ne ""} {
        my markItem $markItem
    }
}
