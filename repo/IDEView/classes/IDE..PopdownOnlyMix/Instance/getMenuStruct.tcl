IDE::PopdownOnlyMix instproc getMenuStruct {} {
    IDE::MenuStruct create [self]::ms Methods 0 -popdownMenuOnly 1
}
