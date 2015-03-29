IDE::IntroProxy proc getMethodsForCategoryBForObject {object category {postFix Procs}} {
    if {$category eq "_all_categories"} {
        if {$postFix eq ""} {
	    set methods [$object info instprocs]
	    foreach par [$object info parameter] {
		set parname [lindex $par 0]
		if {[set index [lsearch $methods $parname]]>=0} {
		    set methods [lreplace $methods $index $index]
		}
	    }
	    return $methods
	} else {
            return [$object info procs]
        }
    } elseif {$category eq "_uncategorized"} {
        set allcategorized {}
        foreach c [my getMetadataForObject $object categoriesMethods$postFix] {
            set allcategorized [concat $allcategorized $c]
        }
        set all [my getMethodsForCategoryBForObject $object _all_categories $postFix]
        ide::lremoveAll all $allcategorized
        return $all
    }
    set catindex [my addCategoryBForObject $object $category $postFix]
    return [lindex [my getMetadataForObject $object categoriesMethods$postFix] $catindex]
}
