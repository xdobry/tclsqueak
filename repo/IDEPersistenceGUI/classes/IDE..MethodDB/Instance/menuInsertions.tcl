IDE::MethodDB instproc menuInsertions aMenuStruct {
    $aMenuStruct addSeparator

    set m ${aMenuStruct}::vcontrol
    IDE::MenuStruct $m {Version Control} -popdownMenu 1
    $aMenuStruct addCascadeMenu $m

    $m addCommand2 Available [list [self] loadFromDB]
    $m addCommand2 Editions [list [self] dispatchWithSelectedMethod loadEdition] {isValidSelection isSelectionPersistent}
    $m addCommand2 Changes [list [self] dispatchWithSelectedMethod browseChanges] {isValidSelection isSelectionPersistent}
    $m addCommand2 {Load Previous} [list [self] dispatchWithMethodDescriptor loadPrevious] {isValidSelection isSelectionPersistent}
    $m addCommand3 {Version Tree} [list [self] dispatchWithMethodDescriptor showVersionTree] {isValidSelection isSelectionPersistent}
    $m addCommand2 Info [list [self] dispatchWithMethodDescriptor versionInfo] {isValidSelection isSelectionPersistent}
}
