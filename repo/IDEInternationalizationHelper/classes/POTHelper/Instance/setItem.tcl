POTHelper instproc setItem id {
    my instvar catalog win item
    if {$id<0 || $id>=[llength $catalog]} return
    set item $id
    $win.itemcount configure -text "[expr {$id+1}] from [llength $catalog]"
    set original [lindex $catalog $id]
    [self]::original setText $original
    set translation [msgcat::mc $original]
    if {$translation eq $original} {
        [self]::translation setTextControler "" [self]
    } else {
        [self]::translation setTextControler $translation [self]
    }
}
