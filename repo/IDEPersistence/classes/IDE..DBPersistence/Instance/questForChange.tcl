IDE::DBPersistence instproc questForChange {} {
    my instvar isclosed
    if {[info exists isclosed] && $isclosed==1} {
        return [my createNewEdition]
    }
    my questForOwn
}
