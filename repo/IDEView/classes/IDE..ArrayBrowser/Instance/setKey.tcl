IDE::ArrayBrowser instproc setKey {key value} {
    my instvar varray
    my varAction set ${varray}($key) $value
}
