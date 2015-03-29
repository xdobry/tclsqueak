IDE::GUICommands instproc getMenuStruct {} {
    IDE::MenuStruct create [self]::ms [namespace tail [self class]]
}
