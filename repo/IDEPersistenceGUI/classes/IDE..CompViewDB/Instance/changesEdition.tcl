IDE::CompViewDB instproc changesEdition cobj {
    set comp2id [IDE::VersionChooser getVersionForComponent [$cobj getName]]
    if {$comp2id eq ""} return
    if {$comp2id==[$cobj set componentid]} {
        IDE::Dialog message "Choosen Edition $comp2id of [$cobj getName] is the same with actual loaded"
        return
    }
    IDE::ChangesBrowser compareComponents $cobj [IDE::ComponentEdition new $comp2id]
}
