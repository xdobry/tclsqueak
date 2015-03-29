IDE::IntroProxy proc hasMetadataForObject {object key} {
    $object exists _idemeta($key)
}
