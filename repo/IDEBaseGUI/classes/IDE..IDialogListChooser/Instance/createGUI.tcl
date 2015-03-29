IDE::IDialogListChooser instproc createGUI {} {
    my instvar win

    my createBaseSubwidgets

    button $win.lframe.addtolist -text >> -command [list [self] addToList]

    pack $win.lframe.listin -side left -expand yes -fill both
    pack $win.lframe.listout -side right -expand yes -fill both
    pack $win.lframe.addtolist -anchor s
    pack $win.lframe.delfromlist -anchor n

    pack $win.lframe -fill both -expand yes -before $win.buttons
}
