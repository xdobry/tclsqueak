IDE::TclGroupDefinition instproc specificInit {} {
    my instvar win

    frame $win.buttons -relief raised -border 3
    frame $win.fname

    message $win.message -text {Give new name for tcl procs group} -width 250
    label $win.fname.lname -text Name
    entry $win.fname.name

    my requireNamespace
    checkbutton $win.isnamespace -text "use name as Tcl namespace" -variable [self]::isnamespace

    button $win.buttons.ok -text Create -command [list [self] actionCreate]
    button $win.buttons.cancel -text Cancel -command "destroy $win; [self] destroy"
    pack $win.buttons.ok $win.buttons.cancel -side left
    pack $win.fname.lname $win.fname.name -side left
    pack $win.message
    pack $win.fname -anchor w
    pack $win.isnamespace -anchor w
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x

    next
}
