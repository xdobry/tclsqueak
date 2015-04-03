IDE::ClassViewDB instproc menuInsertions aMenuStruct {
    $aMenuStruct addSeparator

    set m ${aMenuStruct}::vcontrol
    IDE::MenuStruct $m {Version Control} -popdownMenu 1
    $aMenuStruct addCascadeMenu $m
    $m enablementHandler [self]

    $m addCommand Available [list [self] loadFromDB]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name Editions -command [list [self] dispatchWithSelectedCheck loadEdition] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name "Class Def Editions" -command [list [self] dispatchWithSelectedClassCheck loadClassDefEdition] -enableList [list isValidSelection isSelectionPersistentClass]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name Changes -command [list [self] dispatchWithSelectedCheck browseChanges] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name Version -command [list [self] dispatchWithSelectedCheck versionEdition] -enableList [list isValidSelection isSelectionPersistent isSelectionEdition]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {New Edition} -command [list [self] dispatchWithSelectedCheck createNewEdition] -enableList [list isValidSelection isSelectionPersistent isSelectionVersion]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Reload Edition} -command [list [self] dispatchWithSelectedCheck reloadEdition] -enableList [list isValidSelection isSelectionPersistent isSelectionEdition]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Load Previous} -command [list [self] dispatchWithSelectedCheck loadPrevious] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Version Tree} -command [list [self] dispatchWithSelectedCheck showVersionTree] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name Info -command [list [self] dispatchWithSelectedCheck versionInfo] -enableList [list isValidSelection isSelectionPersistent]]
}
