IDE::MethodDB instproc menuInsertions aMenuStruct {
    $aMenuStruct addSeparator

    set m [IDE::MenuStruct ${aMenuStruct}::vcontrol {Version Control} -popdownMenu 1]
    $aMenuStruct addCascadeMenu $m

    $m addCommand2 {Available Methods for Type} [list [self] loadFromDB]
    $m addCommand2 {Revision History} [list [self] dispatchWithSelectedMethod loadEdition] {isValidSelection isSelectionPersistent}
    $m addCommand2 {Compare With} [list [self] dispatchWithSelectedMethod browseChanges] {isValidSelection isSelectionPersistent}
    $m addCommand2 {Load Previous Revsion} [list [self] dispatchWithMethodDescriptor loadPrevious] {isValidSelection isSelectionPersistent}
    $m addCommand3 {Show Revision Graph} [list [self] dispatchWithMethodDescriptor showVersionTree] {isValidSelection isSelectionPersistent}
    $m addCommand2 {Revision Properties} [list [self] dispatchWithMethodDescriptor versionInfo] {isValidSelection isSelectionPersistent}
}
