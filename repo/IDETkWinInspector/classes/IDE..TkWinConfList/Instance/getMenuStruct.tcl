IDE::TkWinConfList instproc getMenuStruct {} {
    return [IDE::MenuStruct [self]::ms Configurations 0]
}
