IDE::ComponentPersistence instproc questForChange {} {
    my instvar isclosed
    if {[info exists isclosed]} {
        if {$isclosed==1} {
            if {[IDE::Dialog yesNo "Component [my getName] is versioned. Should I create new edition to apply changes"] eq "yes"} {
                return [my createNewEdition]
            }
            return 0
        }
    }
    my questForOwn
}
