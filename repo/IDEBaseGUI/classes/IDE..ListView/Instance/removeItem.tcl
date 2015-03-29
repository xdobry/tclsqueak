IDE::ListView instproc removeItem item {
    if {[set cur [lsearch -exact [my set listItems] $item]]>=0} {
        my removeItemAt $cur
    }
}
