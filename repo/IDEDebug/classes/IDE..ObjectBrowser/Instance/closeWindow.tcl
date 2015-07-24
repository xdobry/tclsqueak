IDE::ObjectBrowser instproc closeWindow {} {
    my instvar type vobject
    if {[[self]::methodedit askForModification]} {
        if {$type eq "single" && [Object isobject $vobject]} {
            if {[$vobject hasclass IDE::DestroyMixForward]} {
                $vobject unregisterDestroyForwardObj [self]
            }
        }
        next
    }
}
