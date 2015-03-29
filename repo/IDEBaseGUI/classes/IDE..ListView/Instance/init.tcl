IDE::ListView instproc init window {
    my instvar win selectedIndex multiselect label height
    set win $window
    my set listItems {}
    frame $win
    if {$multiselect} {
        set selmode extended
    } else {
        set selmode browse
    }
    if {[info exists label]} {
        label $win.label -text $label
        pack $win.label -anchor w
    }
    scrollbar $win.scroll -command "$win.listbox yview" -takefocus 0
    set bgcolor [IBGParameterAdapter getParameter listcolor]
    if  {$bgcolor ne ""} {
        listbox $win.listbox -yscrollcommand "$win.scroll set"  -exportselection no -selectmode $selmode -height $height -font listboxfont -background $bgcolor
    } else {
        listbox $win.listbox -yscrollcommand "$win.scroll set"  -exportselection no -selectmode $selmode -height $height -font listboxfont
    }
    if {[my exists width]} {
        $win.listbox configure -width [my width]
    }
    bind $win.listbox <<ListboxSelect>> [list [self] buttonPush]
    bind $win.listbox <Double-Button-1> [list [self] buttonDoublePush]
    bind $win.listbox <Key> [list [self] keyEvent %A]
    pack $win.scroll -side right -fill y
    pack $win.listbox -expand yes -fill both
    set selectedIndex -1
    next
}
