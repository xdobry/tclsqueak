IDE::Text instproc askForModification {} {
    if {[my hasModifications]} {
        expr {[IDE::Dialog yesNo "The edit area contains unsaved text. Do you want to loose the changes"] eq "yes"}
    } else {
        return 1
    }
}
