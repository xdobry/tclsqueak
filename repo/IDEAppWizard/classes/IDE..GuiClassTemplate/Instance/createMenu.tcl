IDE::GuiClassTemplate instproc createMenu {} {
    my instvar win root
    menu $win.mb
    menu $win.mb.file -tearoff 0

    # just 2 menu entries with command handlers
    $win.mb.file add command -label "Cancel" -command [list [self] btn_cancel_click]
    # add debug menu if running in tclsqueak envirorment
    if {[namespace exists ::IDE::ObjectBrowser]} {
        $win.mb.file add command -label "Inspect Instance" -command [list ::IDE::ObjectBrowser newBrowser [self]]
    }
    $win.mb.file add command -label "Close" -command [list [self] closeWindow]

    $win.mb add cascade -label File -menu $win.mb.file
    $root configure -menu $win.mb
}
