IDE::EditionsMultiChooser instproc removeItems {} {
    set sobj [[self]::@adds getSelectedObjects]
    if {$sobj eq ""} return
    [self]::@adds removeObject $sobj
    set name [$sobj name]
    foreach group [my names] {
        if {[$group name]==$name} {
            [self]::@names insertObjectAt $group end
            break
        }
    }
}
