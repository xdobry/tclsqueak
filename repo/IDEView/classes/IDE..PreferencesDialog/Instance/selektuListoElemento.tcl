IDE::PreferencesDialog instproc selektuListoElemento {} {
    my instvar win
    set currsel [lindex [$win.kat curselection] 0]
    if {$currsel ne ""} {
        my montruKategorion $currsel
    }
}
