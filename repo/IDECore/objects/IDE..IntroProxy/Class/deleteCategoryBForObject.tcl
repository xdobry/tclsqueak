IDE::IntroProxy proc deleteCategoryBForObject {object name {postFix Procs}} {
    if {![my hasMetadataForObject $object categories$postFix]} {return 0}
    set categories [my getMetadataForObject $object categories$postFix]
    if {[set index [lsearch $categories $name]]<0} {
	return 0
    }
    set categories [lreplace $categories $index $index]
    my setMetadataForObject $object categories$postFix $categories
    my setMetadataForObject $object categoriesMethods$postFix [lreplace [my getMetadataForObject $object categoriesMethods$postFix] $index $index]
    return 1
}
