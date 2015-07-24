IDE::VarsView instproc askForItemChange {} {
    if {[Object isobject [my info parent]::methodedit]} {
        [my info parent]::methodedit askForModification
    } else {
        return 1
    }
}
