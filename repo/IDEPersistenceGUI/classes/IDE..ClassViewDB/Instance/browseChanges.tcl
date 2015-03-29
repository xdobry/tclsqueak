IDE::ClassViewDB instproc browseChanges dobj {
    set actual [$dobj getObjectName]
    set obj2id [IDE::VersionChooser getVersion IDE::ObjectDescription $actual]
    if {$obj2id eq ""} return
    if {$obj2id==[$dobj set objectid]} {
        IDE::Dialog message "Choosen Edition $obj2id of $actual is the same with actual loaded"
        return
    }
    # !! IDE::ProcsGroup do not have interface for direct methodArray asking
    # so we build here an proxy IDE::ObjectEdition
    if {[$dobj istype IDE::ProcsGroup]} {
        set dobj [IDE::ObjectEdition new $actual [$dobj set objectid] -type ProcsGroup]
    }
    IDE::ChangesBrowser compareObjects $dobj [IDE::ObjectEdition new $actual $obj2id]
}
