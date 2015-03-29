IDE::ClassDescription instproc getDescription {} {
    set sdesc [self]::description
    if {[Object isobject $sdesc]} {
        return $sdesc
    } else {
        return [self]
    }
}
