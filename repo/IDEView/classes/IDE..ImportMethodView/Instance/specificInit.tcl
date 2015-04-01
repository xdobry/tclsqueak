IDE::ImportMethodView instproc specificInit {} {
    my instvar win hideTclTk

    my requireNamespace
    set hideTclTk 1

    message $win.info -text "With with tool you can import tcl procedures known by interpreter but not registered in TclSqueak. It can be used by starting TclSqueak form foreign applicaiton or executing tcl scripts that create procs" -width 450

    IDE::ListView create [self]::methodlist $win.mlist -multiselect 1
    entry $win.efilter
    $win.efilter insert 0 *
    button $win.usefilter -text "Use Filter" -command [list [self] useFilter]
    button $win.import -text "Import" -command [list [self] importMethods]
    checkbutton $win.hideTclTk -text "Hide tcl-tk core" -variable [self]::hideTclTk

    grid $win.info -column 0 -row 0
    grid $win.mlist -column 0 -row 1 -columnspan 2 -sticky news
    grid $win.efilter -column 0 -row 2 -sticky w
    grid $win.usefilter -column 1 -row 2 -sticky w
    grid $win.hideTclTk -column 0 -row 3 -sticky w
    grid $win.import -column 0 -row 4 -sticky w
    grid rowconfigure $win 0 -weight 1
    grid columnconfigure $win 0 -weight 1

    my useFilter
}
