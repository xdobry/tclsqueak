IDE::CompView instproc selectItem item {
    my instvar vcomponent
    set vcomponent $item
    if {[Object isobject [my info parent]::classview]} {
        [my info parent]::classview selectFor $item
    }
    my refreshView
    [my info parent] setTitleAddition $item
}
