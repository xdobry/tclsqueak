IDE::ConfigmapBrowser instproc getMenuStruct {} {
    return [IDE::MenuStruct [self]::ms Configuration 0]
}
