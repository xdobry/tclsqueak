IDE::ArrayBrowser instproc addKey {} {
    set key [IDE::IDialogEntry getValue {Enter new key name}]
    if {$key eq ""} return
    my addKeyBase $key
    [self]::keys addItem $key
    [self]::keys setSelectedItem $key
}
