IDE::HeritageClassView instproc setSelectedClass tclass {
    foreach e [my getList] {
        if {[string trimleft $e] eq $tclass} {
            my setSelectedItem $e 0
        }
    }
}
