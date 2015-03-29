IDE::XOIntroProxy instproc metadataDefBodyForObject {object meta} {
    set script {}
    append script "@ [string trimleft [$object] :] idemeta $meta [list [my getMetadataForObject $object $meta]]\n"
    return $script
}
