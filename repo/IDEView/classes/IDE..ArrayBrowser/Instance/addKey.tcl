IDE::ArrayBrowser instproc addKey {} {
    my instvar varray
    set key [IDE::IDialogEntry getValue {Enter new key name}]
    if {$key eq ""} return
    my varAction set ${varray}($key) {}
    [self]::keys addItem $key
    [self]::keys setSelectedItem $key
}
