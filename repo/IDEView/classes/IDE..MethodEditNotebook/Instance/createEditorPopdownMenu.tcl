IDE::MethodEditNotebook instproc createEditorPopdownMenu {} {
    set ms [IDE::MenuStruct create [self]::@editms Edit]

    $ms enablementHandler [self]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-q -name {Do it} -command [list [self] dispatchTab evalSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-q -name {Print it} -command [list [self] dispatchTab evalDisplaySelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-x -name {Substitute it} -command [list [self] dispatchTab evalSubstituteSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-g -name {Inspect it} -command [list [self] dispatchTab evalInspectSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-r -name {Browse it} -command [list [self] dispatchTab browseSelection] -popdownMenu 1 -enableList isValidTextSelection]

    $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]

    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find/Replace... -command [list [self] findReplace] -popdownMenu 1 -accelerator Control-r]
    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find -command [list [self] directFind] -popdownMenu 1 -accelerator Control-f]

    $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]

    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-s -name Save/Accept -command [list [self] dispatchTab save] -popdownMenu 1]

    return $ms
}
