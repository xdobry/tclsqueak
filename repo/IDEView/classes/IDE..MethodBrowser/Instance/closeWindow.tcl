IDE::MethodBrowser instproc closeWindow {} {
    if {[[self]::methodedit askForModification]} {
        next
    }
}
