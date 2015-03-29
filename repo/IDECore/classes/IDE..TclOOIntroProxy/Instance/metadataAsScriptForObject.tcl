IDE::TclOOIntroProxy instproc metadataAsScriptForObject object {
    my instvar idemeta
    set object [IDE::XOIntroProxy normalizeName $object]
    if {![catch {set $idemeta($object)} dict]} {
        set script {}
        foreach meta [lsort [dict keys $dict]] {
            if {$meta in {categoriesMethodsProcs  categoriesProcs categoriesMethods categories} && [dict get $dict $meta] eq ""} continue
            append script [my metadataDefBodyForObject $object $meta]
        }
        return $script
    }
    return
}
