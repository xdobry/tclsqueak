IDE::XOIntroProxy instproc getComponentNameForObject object {
    if {[my hasMetadataNotEmptyForObject $object component]} {
        return [my getMetadataForObject $object component]
    }  else {
        return default
    }
}
