IDEStarter proc addCategoryBForObject {object category {postFix Procs}} {
    my initCategoriesForObject $object $postFix

    set categories [my getMetadataForObject $object categories$postFix]
    if {[set index [lsearch $categories $category]]<0} {
	set index [llength $categories]
	lappend categories $category
	my setMetadataForObject $object categories$postFix $categories
	my setMetadataForObject $object categoriesMethods$postFix [concat [my getMetadataForObject $object categoriesMethods$postFix] [list {}]]
    }
    return $index
}
