IDE::EditionBrowser instproc specificInit {} {
    my instvar win mode vtype
    set vtype Instance

    panedwindow $win.rigtharea -orient vertical
    if {$mode eq "component"} {
        panedwindow $win.upperarea -orient horizontal
    }
    frame $win.mframe

    IDE::Editor create [self]::methodedit $win.methodedit
    IDE::NListView create [self]::methods $win.methods -notify [self] -notifyProc selectMethod -label {Methods}
    IDE::TabButtons create [self]::cbutton $win.cbutton  -states {Instance Class} -command [list [self] changeViewType]
    pack $win.methods -in $win.mframe -expand yes -fill both
    pack $win.cbutton -in $win.mframe -anchor w

    if {$mode eq "component"} {
        IDE::NListView create [self]::classes $win.classes -notify [self] -notifyProc selectClass -label {Classes/Objects}
        $win.upperarea add $win.classes $win.mframe
        set upperwin $win.upperarea
    } else {
        set upperwin $win.mframe
    }

    $win.rigtharea add $upperwin $win.methodedit

    pack  $win.rigtharea -fill both -expand yes

    next
}
