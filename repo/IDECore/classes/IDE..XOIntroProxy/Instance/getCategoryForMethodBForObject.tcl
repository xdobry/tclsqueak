IDE::XOIntroProxy instproc getCategoryForMethodBForObject {object method {postFix Procs}} {
    my initCategoriesForObject $object $postFix

    set catindex 0
    foreach cat [my getMetadataForObject $object categoriesMethods$postFix] {
	if {[set index [lsearch $cat $method]]>=0} {
	    return [lindex [my getMetadataForObject $object categories$postFix] $catindex]
	}
	incr catindex
    }
    return {}
}
