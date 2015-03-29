IDE::IntroProxy proc metadataAsScriptPurForObject object {
    set script {}
    $object instvar _idemeta
    foreach meta [array names _idemeta] {
        if {$meta in {categoriesMethodsProcs  categoriesProcs categoriesMethods categories component}} continue
	append script [my metadataDefBodyForObject $object $meta]
    }
    return $script
}
