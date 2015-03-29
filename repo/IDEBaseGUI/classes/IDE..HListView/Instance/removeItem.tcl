IDE::HListView instproc removeItem item {
    set index 0
    foreach elem [my set listItems] {
        if {[string trimleft $elem] eq $item} {
            my removeItemAt $index
            return
        }
        incr index
    }
}
