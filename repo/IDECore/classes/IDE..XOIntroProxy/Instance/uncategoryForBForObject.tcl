IDE::XOIntroProxy instproc uncategoryForBForObject {object method {postFix Procs}} {
    my initCategoriesForObject $object $postFix

    set catindex 0
    foreach cat [set cm [my getMetadataForObject $object categoriesMethods$postFix]] {
	if {[set index [lsearch $cat $method]]>=0} {
	    set cat [lreplace $cat $index $index]
	    my setMetadataForObject $object categoriesMethods$postFix [lreplace $cm $catindex $catindex $cat]
	    return
	}
	incr catindex
    }
}
