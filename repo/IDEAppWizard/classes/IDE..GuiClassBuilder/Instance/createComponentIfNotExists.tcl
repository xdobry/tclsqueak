IDE::GuiClassBuilder instproc createComponentIfNotExists {component desc} {
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} {
        set cobj [IDE::Component createCompObjectForName $component [dict get $desc ooSystemType] [dict get $desc namespace]]
    } else {
        if {[dict get $desc ooSystemType] ne [$cobj getOOType]} {
            error "unmatched OO Type is [$cobj getOOType] required [dict get $desc ooSystemType]"
        }
        if {[dict get $desc namespace] ne [$cobj getNamespace]} {
            error "unmatched namespace [$cobj getNamespace] required [dict get $desc namespace]"
        }
    }
    return $cobj
}
