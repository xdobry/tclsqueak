IDE::ArrayBrowser instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]
    set keyName [my getKeyElemName]

    $aMenuStruct addCommand2 "Add $keyName" [list [self] addKey] isValidSelection
    $aMenuStruct addCommand2 "Remove $keyName" [list [self] dispatchWithKey removeKey] isValidSelection
    $aMenuStruct addCommand2 {Inspect As Object} [list [self] dispatchWithKey inspectAsObject] isValidSelection
    $aMenuStruct addCommand2 {Inspect As Object List} [list [self] dispatchWithKey inspectAsObjectList] isValidSelection
    $aMenuStruct addCommand2 {Refresh} [list [self] initContents]
}
