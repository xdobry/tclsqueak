IDE::ArrayBrowser instproc editSave {value {desc {}}} {
    set key [[self]::keys selectedItem]
    if {$key eq ""} return
    my setKey $key $value
}
