IDE::SyntaxChecker instproc setListViews {} {
    my instvar errorsArr
    if {[array exists errorsArr]} {
        [self]::methods setList [array names errorsArr]
    } else {
        [self]::methods setList {}
    }
    [self]::messages setListUnsorted {}
}
