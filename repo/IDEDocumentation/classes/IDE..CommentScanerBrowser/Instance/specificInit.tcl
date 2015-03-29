IDE::CommentScanerBrowser instproc specificInit {} {
    my instvar win

    message $win.message -text "This tool try to extract the standart tcl comment # (just before procedure header) from choosen files and set them as XotclIDE comments.\nYou can use this tool just after importing xotcl stuff to xotclide" -width 350
    
    frame $win.sel
    frame $win.dir
    
    button $win.scane -text Scane -command [list [self] scane]
    button $win.sel.all -text "All files" -command [list [self] selectAll]
    button $win.sel.allTcl -text "All tcl files" -command [list [self] selectTcl]
    button $win.dir.changedir -text "Change Dir" -command [list [self] changeDir]
    label $win.dir.dirname -relief sunken -border 2 -width 50 -anchor w
        
    IDE::ListView create [self]::files $win.files -multiselect 1
    
    pack $win.dir.dirname -fill x -expand yes -side left
    pack $win.dir.changedir -side left
    pack $win.sel.all $win.sel.allTcl -side left
    pack $win.message  -fill x
    pack $win.dir -anchor w -fill x
    pack $win.files -fill both -expand yes
    pack $win.sel $win.scane -anchor w
    
    my readDir
}
