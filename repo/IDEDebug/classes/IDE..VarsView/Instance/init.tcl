IDE::VarsView instproc init window {
    my instvar win
    next
    if {[my hasLock]} {
        my requireNamespace
        frame $win.labframe
        checkbutton $win.lock -text lock -variable [self]::lock -command [list [self] lockStateChange]
        raise $win.label
        pack forget $win.label
        pack $win.label -side left -in $win.labframe -anchor w
        pack $win.lock -side right -in $win.labframe -anchor e
        pack $win.labframe -anchor e -side top -before $win.listbox -fill x
    }
}
