IDE::EditorPopDown instproc getPopdown {} {
    my instvar dropWin
    if {![my exists dropWin]} {
        set win [my getTextWindow]
        set dropWin $win.dropshell
        menu $dropWin -bd 2 -relief raised -tearoff 0
        wm overrideredirect $dropWin 1
        ttk::scrollbar $dropWin.scroll -command "$dropWin.listbox yview" -takefocus 0
        listbox $dropWin.listbox -height 10 -width 24  -yscrollcommand "$dropWin.scroll set"  -exportselection no -selectmode single
        bind $dropWin.listbox <<ListboxSelect>> [list [self] selectDropDown]
        bind $dropWin.listbox <Key-Escape> [list [self] hidePopdown]
        pack $dropWin.listbox -expand yes  -fill both -side left
        pack $dropWin.scroll -expand yes  -fill y -side left
        wm withdraw $dropWin
    }
    return $dropWin
}
