IDE::CommentEdit instproc getMenuStruct {} {
    IDE::MenuStruct create [self]::ms Edit 0 -popdownMenuOnly 1
}
