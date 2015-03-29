Sqlinterface instproc destroy {} {
    # Vielleicht bracht das Klassenkind noch die Verbindung
    #next
    # Next verursacht ein Fehler +++ ::Can´t find self
    my instvar connected
    if {[info exists connected] && $connected} {
        my disconnect
    }
    next
}
