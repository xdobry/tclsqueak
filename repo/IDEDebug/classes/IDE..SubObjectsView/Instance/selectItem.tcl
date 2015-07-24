IDE::SubObjectsView instproc selectItem object {
    set object [my selectionAsObject]
    if {$object eq ""} return
    if {[Object isobject [my info parent]::methodedit]} {
        [my info parent]::methodedit setTextControler [$object printString] [self]
    }
}
