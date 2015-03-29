proc ide::lremove {list_ref elem} {
    upvar $list_ref list
    if {[set index [lsearch -exact $list $elem]]>=0} {
	    set list [lreplace $list $index $index]
	    return 1
    }
    return 0
}
