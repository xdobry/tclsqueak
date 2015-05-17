IDE::StructureBrowser instproc addKey {} {
    my instvar type content
    if {$type ne "list"} {
        next
    } else {
        set key [IDE::IDialogEntry getValue {Enter insert position or 'end'} end]
        if {$key eq ""} return
        set content [linsert $content $key {}]
        [self]::keys addItemAtTail [expr {[llength $content]-1}]
    }
}
