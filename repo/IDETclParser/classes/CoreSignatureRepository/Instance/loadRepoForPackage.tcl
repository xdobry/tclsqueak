CoreSignatureRepository instproc loadRepoForPackage packageName {
    my instvar knownPackages
    if {$packageName eq "XOTcl"} {
        if {![info exists knownPackages] || $packageName ni $knownPackages} {
            my registerXotclCoreMethods
        }
        return
    }
    if {$packageName eq "Itcl"} {
        if {![info exists knownPackages] || $packageName ni $knownPackages} {
            my registerItcl
        }
        return
    }
    if {$packageName eq "TclOO"} {
        if {![info exists knownPackages] || $packageName ni $knownPackages} {
            my registerTclOO
        }
        return
    }
    next
}
