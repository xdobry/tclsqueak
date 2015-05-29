IDE::TclGroupDefinition instproc specificInit {} {
    my instvar win

    ttk::frame $win.buttons -relief raised -borderwidth 3
    ttk::frame $win.fname

    message $win.message -text {Give new name for tcl procs group} -width 250
    ttk::label $win.fname.lname -text Name
    ttk::entry $win.fname.name

    my requireNamespace
    ttk::checkbutton $win.isnamespace -text "use name as Tcl namespace" -variable [self]::isnamespace

    ttk::button $win.buttons.ok -text Create -command [list [self] actionCreate]
    ttk::button $win.buttons.cancel -text Cancel -command "destroy $win; [self] destroy"
    pack $win.buttons.ok $win.buttons.cancel -side left
    pack $win.fname.lname $win.fname.name -side left
    pack $win.message
    pack $win.fname -anchor w
    pack $win.isnamespace -anchor w
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x

    next
}
