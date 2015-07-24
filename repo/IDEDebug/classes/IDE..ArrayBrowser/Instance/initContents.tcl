IDE::ArrayBrowser instproc initContents {} {
    my instvar varray
    [self]::keys setList [my varAction array names $varray]
}
