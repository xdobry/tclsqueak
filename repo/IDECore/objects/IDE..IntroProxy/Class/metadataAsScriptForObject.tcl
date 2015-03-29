IDE::IntroProxy proc metadataAsScriptForObject object {
    set script {}
    $object instvar _idemeta
    foreach meta [lsort [array names _idemeta]] {
        if {$meta in {categoriesMethodsProcs  categoriesProcs categoriesMethods categories} && $_idemeta($meta) eq ""} continue
	append script [my metadataDefBodyForObject $object $meta]
    }
    return $script
}
