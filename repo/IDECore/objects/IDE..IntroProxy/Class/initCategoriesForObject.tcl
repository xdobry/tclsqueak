IDE::IntroProxy proc initCategoriesForObject {object postFix} {
    if {![my hasMetadataForObject $object categories$postFix]} {
	my setMetadataForObject $object categories$postFix {}
	my setMetadataForObject $object categoriesMethods$postFix {}
	return
    }
}
