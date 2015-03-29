IDE::AvailableView instproc selectItem item {
    set parent [my info parent]
    ${parent}::version selectFor $item
    ${parent}::version setSelectedIndex 0
    ${parent} set name $item
}
