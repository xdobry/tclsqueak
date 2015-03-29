IDEStarter proc hasMetadataForObject {object key} {
    $object exists _idemeta($key)
}
