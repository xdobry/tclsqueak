IDE::CompView instproc newComponent {} {
    set idialog [IDE::CreateComponentDialog new -volatile]
    if {[$idialog prompt] eq "ok"} {
        set component [$idialog set name]
        set ootype [$idialog set ootype]
        set namespace [$idialog set namespace]
        if {$namespace ne "" && [string range $namespace 0 1] ne "::"} {
            set namespace ::$namespace
        }
        set installInRepo [$idialog set installInRepo]
        if {![regexp {^[\w:]+$} $component]} {
            IDE::Dialog error {Wrong name for the component}
            return
        }
        if {$component ne "" && [IDE::Component getCompObjectForNameIfExist $component] eq ""} {
            my createNewComponent $component $ootype $namespace $installInRepo
        } else {
            IDE::Dialog error "Component $component already exists. No action"
        }
    }
}
