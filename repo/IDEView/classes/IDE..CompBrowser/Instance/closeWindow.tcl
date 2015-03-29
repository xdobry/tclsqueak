IDE::CompBrowser instproc closeWindow {} {
    if {[[self]::methodedit askForModification]} {
        next
    }
}
