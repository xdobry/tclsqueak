IDE::ArrayBrowser instproc getMenuStruct {} {
    IDE::MenuStruct create [self]::ms [my getTitle] 0
}
