proc ide::lremoveAll {list_ref listr} {
	upvar $list_ref list
        foreach elem $listr {
            lremove list $elem
        }
}
