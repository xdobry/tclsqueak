POTHelper instproc scanComponents {} {
    foreach c [[self]::components selectedItems] {
        my scanComponent $c
    }
    my setItem 0
}
