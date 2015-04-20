IDE::TclOOIntroProxy instproc metadataDefBodyForObject {object meta} {
    set script {}
    append script "@ [string trimleft [namespace which $object] :] idemeta $meta [list [my getMetadataForObject $object $meta]]\n"
    return $script
}
