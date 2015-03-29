IDE::SyntaxChecker instproc removeMethod {} {
    my instvar errorsArr
    set item [[self]::methods selectedItem]
    if {$item eq ""} return
    if {[array exists errorsArr]} {
        unset errorsArr($item)
        my setListViews
    }
}
