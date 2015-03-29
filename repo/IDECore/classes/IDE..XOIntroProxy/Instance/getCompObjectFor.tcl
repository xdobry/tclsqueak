IDE::XOIntroProxy instproc getCompObjectFor object {
    if {[my hasMetadataNotEmptyForObject $object component]} {
        return [IDE::Component getCompObjectForName [my getMetadataForObject $object component]]
    }  else {
        return [IDE::Component getCompObjectForName default]
    }
}
