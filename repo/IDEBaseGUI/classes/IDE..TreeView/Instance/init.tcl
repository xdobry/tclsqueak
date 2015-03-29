IDE::TreeView instproc init window {
    my instvar win selectedIndex label height
    set win $window
    my set listItems {}
    frame $win
    if {[info exists label]} {
        label $win.label -text $label
        pack $win.label -anchor w
    }
    scrollbar $win.scroll -command "$win.listbox yview" -takefocus 0
    set bgcolor [IBGParameterAdapter getParameter listcolor]
    if  {$bgcolor ne ""} {
        ttk::treeview $win.listbox -yscrollcommand "$win.scroll set"  -height $height
    } else {
        ttk::treeview $win.listbox -yscrollcommand "$win.scroll set"  -height $height
    }
    if {[my exists width]} {
        $win.listbox configure -width [my width]
    }
    bind $win.listbox <<TreeviewSelect>> [list [self] treeSelect]
    bind $win.listbox <Double-Button-1> [list [self] buttonDoublePush]
    pack $win.scroll -side right -fill y
    pack $win.listbox -expand yes -fill both
    set selectedIndex -1
    next
}
