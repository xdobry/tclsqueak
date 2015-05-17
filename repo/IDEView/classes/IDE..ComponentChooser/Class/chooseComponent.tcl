IDE::ComponentChooser proc chooseComponent {title ootype ignorelist} {
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    if {[IDEPreferences getParameter ignoreIDEComponents]} {
        set compList [$introProxy getComponentsNoIDE]
    } else {
        set compList [$introProxy getComponents]
    }
    set forchoose [list]
    foreach c [lsort $compList] {
        if {$c in $ignorelist} {
            continue
        }
        if {$ootype ne ""} {
            set cobj [IDE::Component getCompObjectForNameIfExist $c]
            if {$cobj eq "" || [$cobj getOOType] ne $ootype} {
                continue
            }
        }
        lappend forchoose $c
    }
    if {[llength $forchoose]==0} {
        IDE::Dialog message "No compoent for choose found of type: $ootype"
        return
    }
    set dialog [IDE::IDialogList new -message $title  -list $forchoose]
    set ret {}
    if {[$dialog prompt] eq "ok"} {
        set ret [$dialog selectedItem]
    }
    $dialog destroy
    return $ret
}
