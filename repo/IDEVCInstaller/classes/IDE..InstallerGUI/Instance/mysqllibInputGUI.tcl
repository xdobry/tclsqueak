IDE::InstallerGUI instproc mysqllibInputGUI {} {
     [self] instvar win usepackage
     set usepackage 1
     set iw $win.inputframe
     ::checkbutton $iw.usepackage -text "try to load package mysqltcl" -variable [self]::usepackage
     IDE::FileNameEntry [self]::libfile $iw.libfile -label "mysqltcl.so location"
     [self]::libfile setValue /usr/local/lib/libmysqltcl.so
     pack $iw.usepackage $iw.libfile -anchor w
}
