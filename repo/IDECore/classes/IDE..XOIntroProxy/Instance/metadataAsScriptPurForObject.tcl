IDE::XOIntroProxy instproc metadataAsScriptPurForObject object {
    my instvar idemeta
    if {![catch {set $idemeta($object)} dict]} {
        set script {}
        foreach meta [lsort [dict keys $dict]] {
            if {$meta in {categoriesMethodsProcs  categoriesProcs categoriesMethods categories component} && [dict get $dict $meta] eq ""} continue
            append script [my metadataDefBodyForObject $object $meta]
        }
        return $script
    }
    return
}
