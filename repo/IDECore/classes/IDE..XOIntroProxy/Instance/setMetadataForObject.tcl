IDE::XOIntroProxy instproc setMetadataForObject {object key value} {
    $object set _idemeta($key) $value
}
