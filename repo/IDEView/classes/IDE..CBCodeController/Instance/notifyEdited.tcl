IDE::CBCodeController instproc notifyEdited contentDesc {
    my setStateSaveButton 1
    [my getMethodedit] notifyEdited $contentDesc
}
