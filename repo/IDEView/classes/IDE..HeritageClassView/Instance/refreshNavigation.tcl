IDE::HeritageClassView instproc refreshNavigation tclass {
    my instvar introProxy actItem
    foreach e [my getList] {
        if {[string trimleft $e] eq $tclass} {
            my setSelectedItem $e 0
            set actItem $tclass
        }
    }
    if {[Object isobject [my info parent]::methodcatview]} {
        [my info parent]::methodcatview selectFor $tclass Classes $introProxy
    }
}
