IDE::IntroProxy proc hasMetadataNotEmptyForObject {object key} {
    expr {[my hasMetadataForObject $object $key] && [$object set _idemeta($key)] ne ""}
}
