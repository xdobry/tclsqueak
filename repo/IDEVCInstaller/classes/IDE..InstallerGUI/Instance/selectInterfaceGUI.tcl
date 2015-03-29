IDE::InstallerGUI instproc selectInterfaceGUI {} {
    [self] instvar win
    set frame $win.inputframe
    
    ::scrollbar $frame.scroll -command "$frame.listbox yview" -takefocus 0
    ::listbox $frame.listbox -yscroll "$frame.scroll set" -exportselection no
    pack $frame.scroll -side right -fill y
    pack $frame.listbox -expand yes -fill both
    
    eval $frame.listbox insert 0 [Sqlinterface getInterfacesNamesCleaned]

}
