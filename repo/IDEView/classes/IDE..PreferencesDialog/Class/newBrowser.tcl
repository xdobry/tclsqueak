IDE::PreferencesDialog proc newBrowser {} {
    my instvar prefobj
    if {![info exists prefobj] || ![Object isobject $prefobj]} {
       set prefobj [my new [Object autoname .pdialog]]
    }
}
