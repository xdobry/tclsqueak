IDE::IntroProxy proc setMetadataForObject {object key value} {
    $object set _idemeta($key) $value
}
