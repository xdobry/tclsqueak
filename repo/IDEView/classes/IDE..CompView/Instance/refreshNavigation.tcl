IDE::CompView instproc refreshNavigation item {
    my instvar vcomponent
    set vcomponent $item
    my setSelectedItem $item 0
    if {[Object isobject [my info parent]::classview]} {
        [my info parent]::classview selectFor $item
    }
}
