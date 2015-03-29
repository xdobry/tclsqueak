IDE::CompViewDB instproc createNewEdition cobj {
    if {[$cobj isclosed]} {
        $cobj createNewEdition
    } else {
        IDE::Dialog message "[$cobj getName] in not versioned."
    }
}
