IDE::ClassViewDB instproc menuInsertions aMenuStruct {
    $aMenuStruct addSeparator

    set m [IDE::MenuStruct ${aMenuStruct}::vcontrol {Version Control} -popdownMenu 1]
    $aMenuStruct addCascadeMenu $m
    $m enablementHandler [self]

    $m addCommand {Available Types} [list [self] loadFromDB]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Revision History} -command [list [self] dispatchWithSelectedCheck loadEdition] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name "Class Definition History" -command [list [self] dispatchWithSelectedClassCheck loadClassDefEdition] -enableList [list isValidSelection isSelectionPersistentClass]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Compare With} -command [list [self] dispatchWithSelectedCheck browseChanges] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Tag/Close Revision} -command [list [self] dispatchWithSelectedCheck versionEdition] -enableList [list isValidSelection isSelectionPersistent isSelectionEdition]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Open New Revision} -command [list [self] dispatchWithSelectedCheck createNewEdition] -enableList [list isValidSelection isSelectionPersistent isSelectionVersion]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Reload Current Revision} -command [list [self] dispatchWithSelectedCheck reloadEdition] -enableList [list isValidSelection isSelectionPersistent isSelectionEdition]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Load Previous Revision} -command [list [self] dispatchWithSelectedCheck loadPrevious] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Show Revision Graph} -command [list [self] dispatchWithSelectedCheck showVersionTree] -enableList [list isValidSelection isSelectionPersistent]]
    $m addMenuItem [IDE::MenuCommand new -childof $m -name {Revision Properties} -command [list [self] dispatchWithSelectedCheck versionInfo] -enableList [list isValidSelection isSelectionPersistent]]
}
