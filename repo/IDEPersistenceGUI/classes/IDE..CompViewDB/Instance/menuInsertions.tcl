IDE::CompViewDB instproc menuInsertions aMenuStruct {
    $aMenuStruct addSeparator

    set m ${aMenuStruct}::vcontrol
    IDE::MenuStruct create $m {Version Control} -popdownMenu 1
    $aMenuStruct addCascadeMenu $m

    $m addCommand2 Available [list [self] loadFromDB]
    $m addCommand2 Editions [list [self] dispatchCompObj loadEdition] {isValidSelection isSelectedPersistent}
    $m addCommand2 Changes [list [self] dispatchCompObj changesEdition] {isValidSelection isSelectedPersistent}
    $m addCommand2 Version [list [self] dispatchCompObj versionEdition] {isValidSelection isSelectedPersistent isSelectedEdition}
    $m addCommand2 {New Edition} [list [self] dispatchCompObj createNewEdition] {isValidSelection isSelectedPersistent isSelectedVersion}
    $m addCommand2 Import [list [self] dispatchWithSelected importToDB] {isValidSelection isSelectedNotPersistent}
    $m addCommand2  {Reload Edition} [list [self] dispatchCompObj reloadEdition] {isValidSelection isSelectedPersistent isSelectedEdition}
    $m addCommand2 {Load Previous} [list [self] dispatchCompObj loadPrevious] {isValidSelection isSelectedPersistent}
    $m addCommand3 {Edit Requirements} [list [self] dispatchCompObj viewRequired] {isValidSelection isSelectedPersistent}
    $m addCommand3 {Compute Requirements} [list [self] dispatchCompObj computeRequired] {isValidSelection isSelectedPersistent isSelectedEdition}
    $m addCommand3 {Version Tree} [list [self] dispatchCompObj showVersionTree] {isValidSelection isSelectedPersistent}
    $m addCommand2 Info [list [self] dispatchCompObj versionInfo] {isValidSelection isSelectedPersistent}
}
