IDE::ListViewEvent instproc refreshLabels {} {
    foreach obj [my set objectsList] {
        lappend elems [$obj [my nameMethod]]
    }
    my setListUnsorted $elems
}
