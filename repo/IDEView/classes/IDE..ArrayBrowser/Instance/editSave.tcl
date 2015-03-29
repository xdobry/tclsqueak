IDE::ArrayBrowser instproc editSave value {
    my instvar varray
    set key [[self]::keys selectedItem]
    if {$key eq ""} return
    my varAction set ${varray}($key) $value
}
