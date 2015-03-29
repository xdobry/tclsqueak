POTHelper instproc specificInit {} {
    my instvar win

    my set item 0
    my set catalog [list]

    message $win.message -text "This tool help to generate message catalog for Tcl internatinalization. It scan sources (after \[mc \"original text\"]), help to produce translation and can genarate .msg files" -width 450

    frame $win.scan
    frame $win.buttons
    frame $win.trans

    IDE::ListView create [self]::components $win.scan.components -multiselect 1 -width 40
    button $win.scan.scan -text "Scan Components" -command [list [self] scanComponents]
    button $win.scan.reread -text "Init from existing msgcat" -command [list [self] initFromExisting]
    button $win.scan.all -text "Select All Components" -command [list [self] selectAll]
    button $win.scan.allTcl -text "Exclude IDE Components" -command [list [self] excludeIDE]

    pack $win.scan.components -side left
    pack $win.scan.scan $win.scan.reread $win.scan.all $win.scan.allTcl -anchor w

    label $win.itemcount

    button $win.buttons.next -text "Next" -command [list [self] nextItem]
    button $win.buttons.prev -text "Prev" -command [list [self] prevItem]
    button $win.buttons.nextEmpty -text "Next Empty" -command [list [self] nextEmptyItem]
    button $win.buttons.prevEmpty -text "Prev Empty" -command [list [self] prevEmptyItem]
    button $win.buttons.first -text "Firtst" -command [list [self] firstItem]
    button $win.buttons.last -text "Last" -command [list [self] lastItem]
    if {[Object isclass AspellTestilo]} {
        button $win.buttons.spell -text "Next misspelled" -command [list [self] nextMisspelledItem]
        button $win.buttons.spelleo -text "Next misspelled Eo" -command [list [self] nextMisspelledEspItem]
        pack $win.buttons.next $win.buttons.prev $win.buttons.nextEmpty $win.buttons.prevEmpty $win.buttons.first $win.buttons.last $win.buttons.spell $win.buttons.spelleo -side left
    } else {
        pack $win.buttons.next $win.buttons.prev $win.buttons.nextEmpty $win.buttons.prevEmpty $win.buttons.first $win.buttons.last -side left
    }


    IDE::Text create [self]::original $win.trans.original -width 40 -height 20
    IDE::MethodEdit create [self]::translation $win.trans.translation -width 40 -height 20

    pack $win.trans.original $win.trans.translation -side left -expand yes -fill both

    button $win.generate -text "Generate Message Catalog" -command [list [self] saveMsg]

    pack $win.message -anchor w
    pack $win.scan -anchor w
    pack $win.buttons -anchor w
    pack $win.itemcount -anchor w
    pack $win.trans -fill both -expand yes
    pack $win.generate -anchor w

    bind $win <Next> [list [self] nextItem]
    bind $win <Prior> [list [self] prevItem]
    my readComponents
}
