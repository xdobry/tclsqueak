IDE::CBCodeController instproc editSave {skript {contentDesc {}}} {
    set desc [next]
    if {[llength $desc]>0} {
        my instvar editHistory
        if {[lindex $editHistory end] ne $contentDesc} {
            lappend editHistory $contentDesc
            my setButtonState lastEditedButton 1
        }
    }
    my setStateSaveButton 0
}
