IDE::IDialogListOrderChooser instproc createGUI {} {
    my instvar win
    
    my createBaseSubwidgets

    button $win.lframe.addtolist -text << -command [list [self] addToList]
    button $win.lframe.upitem -text up -command [list [self] upItem]
    button $win.lframe.downitem -text down -command [list [self] downItem]
     
    pack $win.lframe.listout -side left -expand yes -fill both
    pack $win.lframe.listin -side right -expand yes -fill both
    pack $win.lframe.addtolist -anchor s -fill x
    pack $win.lframe.delfromlist -anchor n -fill x
    pack $win.lframe.upitem -anchor n -fill x
    pack $win.lframe.downitem -anchor n -fill x
 
    pack $win.lframe -fill both -expand yes -before $win.buttons

}
