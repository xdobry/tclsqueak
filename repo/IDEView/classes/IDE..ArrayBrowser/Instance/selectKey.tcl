IDE::ArrayBrowser instproc selectKey key {
    my instvar varray
    my set actual $key
    [self]::edit setTextControler [my varAction set ${varray}($key)] [self]
}
