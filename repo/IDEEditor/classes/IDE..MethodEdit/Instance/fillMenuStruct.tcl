IDE::MethodEdit instproc fillMenuStruct ms {
    next
    $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]
    #$ms addCommand Revert "[self] revert"
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-s -name Save/Accept -command [list [self] save] -popdownMenu 1]
}
