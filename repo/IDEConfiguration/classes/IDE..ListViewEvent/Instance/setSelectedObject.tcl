IDE::ListViewEvent instproc setSelectedObject object {
    set index [lsearch [my set objectsList] $object]
    if {$index>=0} {
        my setSelectedIndex $index 0
    } else {
        error "no object in the list"
    }
}
