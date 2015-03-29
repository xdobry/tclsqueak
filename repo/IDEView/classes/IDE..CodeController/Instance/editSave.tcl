IDE::CodeController instproc editSave skript {
    if {![info complete $skript]} {
        IDE::Dialog message {This is not complete Tcl-Script. Check the paratness}
        return
    }
    regsub -all -line { +$} $skript {} skript
    if {[lindex $skript 0] eq "proc"} {
        my handleProc $skript
    } else {
        my instvar actItem
        lassign $actItem class type method
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
        $introProxy handleScript $skript
    }
}
