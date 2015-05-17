IDE::ArrayBrowser instproc selectKey key {
    my instvar actual
    my set actual $key
    [self]::edit setTextControler [my getKey $key] [self]
}
