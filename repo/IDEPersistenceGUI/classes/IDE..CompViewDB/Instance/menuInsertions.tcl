IDE::CompViewDB instproc menuInsertions aMenuStruct {
    $aMenuStruct addSeparator

    set m [IDE::MenuStruct create ${aMenuStruct}::vcontrol {Version Control} -popdownMenu 1]
    $aMenuStruct addCascadeMenu $m

    $m addCommand2 {Available Components} [list [self] loadFromDB]
    $m addSeparator
    $m addCommand2 {Revision History} [list [self] dispatchCompObj loadEdition] {isValidSelection isSelectedPersistent}
    $m addCommand2 {Compare With} [list [self] dispatchCompObj changesEdition] {isValidSelection isSelectedPersistent}
    $m addCommand2 {Tag/Close Revision} [list [self] dispatchCompObj versionEdition] {isValidSelection isSelectedPersistent isSelectedEdition}
    $m addCommand2 {Open New Revision} [list [self] dispatchCompObj createNewEdition] {isValidSelection isSelectedPersistent isSelectedVersion}
    $m addCommand2  {Reload Current Revision} [list [self] dispatchCompObj reloadEdition] {isValidSelection isSelectedPersistent isSelectedEdition}
    $m addCommand2 {Load Previous Revision} [list [self] dispatchCompObj loadPrevious] {isValidSelection isSelectedPersistent}
    $m addCommand3 {Edit Dependencies} [list [self] dispatchCompObj viewRequired] {isValidSelection isSelectedPersistent}
    $m addCommand3 {Compute Dependecies} [list [self] dispatchCompObj computeRequired] {isValidSelection isSelectedPersistent isSelectedEdition}
    $m addCommand3 {Show Revision Graph} [list [self] dispatchCompObj showVersionTree] {isValidSelection isSelectedPersistent}
    $m addCommand2 {Revision Properties} [list [self] dispatchCompObj versionInfo] {isValidSelection isSelectedPersistent}
    $m addCommand2 {Import into Version Control} [list [self] dispatchWithSelected importToDB] {isValidSelection isSelectedNotPersistent}
}
