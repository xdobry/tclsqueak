IDE::CreateInterp instproc init args {
    my instvar win safeInterp loadTk name
    next
    set safeinterp 0
    set loadtk 1
    my requireNamespace

    frame $win.fname
    label $win.fname.lname -text "interp name"
    entry $win.fname.name -textvariable [self]::name

    pack $win.fname.lname $win.fname.name -side left

    checkbutton $win.csafeinterp -text "use safe interp" -variable [self]::safeInterp
    checkbutton $win.loadtk -text "load tk" -variable [self]::loadTk

    pack $win.fname -anchor w
    pack $win.csafeinterp -anchor w
    pack $win.loadtk -anchor w

    wm deiconify $win
}
