IDE::NSView instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]
    $aMenuStruct addCommand2 {Refresh} [list [my info parent] refresh]
    $aMenuStruct addCheckButton {Ignore XOTcl} [my info parent]::ignoreXotcl [list [my info parent] refresh]
    #$aMenuStruct addCommand2 {Search Text} [list [self] dispatchWithNamespace searchText] isValidSelection
    $aMenuStruct addCommand2 {Dump to Workspace} [list [self] dispatchWithNamespace dumpToWorkspace] isValidSelection
    $aMenuStruct addCommand2 {Create Child Namespace} [list [self] dispatchWithNamespace createChildNamespace] isValidSelection
    $aMenuStruct addCommand2 {Delete Namespace} [list [self] dispatchWithNamespace deleteNamespace] isValidSelection
}
