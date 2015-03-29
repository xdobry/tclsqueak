IDE::PreferencesDialog instproc montruKategorion katnumero {
    my instvar win opcioj aktualaPago
    if {$aktualaPago>=0} {
        pack forget $win.dframe.k$aktualaPago
    }
    set aktualaPago $katnumero
    pack $win.dframe.k$aktualaPago -fill both -expand yes -padx 4 -pady 4
}
