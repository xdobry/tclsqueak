IDE::ArrayBrowser instproc removeKey key {
    my instvar varray
    my varAction unset ${varray}($key)
    [self]::keys removeItem $key
}
