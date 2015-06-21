IDE::ClassViewDB instproc createNewEdition desc {
    if {[$desc isclosed]} {
        $desc createNewEdition
    } else {
        IDE::Dialog message "[$desc getObjectName] in not labeled/closed."
    }
}
