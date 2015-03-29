IDE::XOIntroProxy instproc hasMetadataForObject {object key} {
    $object exists _idemeta($key)
}
