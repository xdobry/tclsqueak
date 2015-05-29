IDE::CodeController instproc editSave {skript {contentDesc {}}} {
    if {![info complete $skript]} {
        IDE::Dialog message {This is not complete Tcl-Script. Check the paratness}
        return
    }
    lassign $contentDesc vclass vtype vmethod
    if {$vtype eq "Component"} {
        return [my handleComponent $skript $contentDesc]
    }
    if {[string range $vtype end-2 end] eq "Def"} {
        return [my handleDefScript $skript $contentDesc]
    }
    # regsub -all -line { +$} $skript {} skript
    if {[lindex $skript 0] eq "proc"} {
        my handleProc $skript $contentDesc
    } else {
        my handleMethod $skript $contentDesc
    }
}
