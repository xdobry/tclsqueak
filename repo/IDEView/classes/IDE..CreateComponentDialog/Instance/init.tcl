IDE::CreateComponentDialog instproc init args {
    my instvar win name ootype userMsg namespace installInRepo
    next
    set ootype XOTcl
    set userMsg ""
    set name ""
    set namespace ""
    set installInRepo 1
    my requireNamespace

    ttk::frame $win.g

    ttk::label $win.lname -text "Component Name:"
    ttk::entry $win.name -textvariable [self]::name

    ttk::frame $win.footype
    ttk::label $win.looname -text "Type of Object Oriented System"
    foreach oosystem {XOTcl TclOO} {
        set rwin $win.footype.[string tolower $oosystem]
        ttk::radiobutton $rwin -text $oosystem -variable [self]::ootype -value $oosystem
        pack $rwin
    }

    ttk::label $win.lnsname -text "namespace (optional):"
    ttk::entry $win.nsname -textvariable [self]::namespace

    ttk::label $win.userMsg -textvariable [self]::userMsg

    grid $win.lname -column 0 -row 0 -in $win.g
    grid $win.name -column 1  -row 0 -sticky w  -in $win.g

    grid $win.looname -column 0 -row 1 -in $win.g
    grid $win.footype -column 1 -row 1 -sticky w -in $win.g

    grid $win.lnsname -column 0 -row 2 -in $win.g
    grid $win.nsname -column 1 -row 2 -sticky w -in $win.g

    grid $win.userMsg -column 0 -row 3 -columnspan 2 -sticky ew -in $win.g
    grid columnconfigure $win.g 1 -weight 1

    if {[IDE::System isDatabase]} {
        ttk::checkbutton $win.installInRepo -text "Install in repository" -variable [self]::installInRepo
        grid $win.installInRepo -column 1 -row 3 -in $win.g -sticky w
    } else {
        set installInRepo 0
    }

    pack $win.g -fill both -expand yes

    wm deiconify $win
}
