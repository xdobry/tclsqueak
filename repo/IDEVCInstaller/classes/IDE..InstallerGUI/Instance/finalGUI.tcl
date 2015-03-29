IDE::InstallerGUI instproc finalGUI {} {
     [self] instvar win copyComponents saveParams
     set saveParams 1
     set copyComponents 1
     set iw $win.inputframe
     ::checkbutton $iw.copycomponents -text "Copy all IDE Components to VC" -variable [self]::copyComponents
     ::checkbutton $iw.saveparams -text "Save Data as preferences" -variable [self]::saveParams
     pack $iw.copycomponents $iw.saveparams -anchor w

}
