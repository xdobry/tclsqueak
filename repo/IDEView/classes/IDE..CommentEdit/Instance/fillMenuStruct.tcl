IDE::CommentEdit instproc fillMenuStruct ms {
    # $ms popdownMenuOnly 1
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator _Control-s -name Save/Accept -command [list [self] save] -popdownMenu 1]
}
