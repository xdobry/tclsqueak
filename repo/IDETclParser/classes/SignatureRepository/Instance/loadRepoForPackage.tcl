SignatureRepository instproc loadRepoForPackage packageName {
    my instvar reposDir knownPackages
    if {![info exists reposDir]} {
        set reposDir [file join [PrsCheckerOptions getRootDir] repos]
    }
    if {$packageName in {Tcl Tk msgcat XOTcl Itcl TclOO}} {
        return
    }
    if {[info exists knownPackages] && $packageName in $knownPackages} {
        return
    }
    set repoName [file join $reposDir $packageName.repo]
    if {[file readable $repoName]} {
        puts "loading repo for $repoName"
        my loadRepository $repoName
    } else {
        tlog::info "can not load signature repository for package $packageName"
    }
    lappend knownPackages $packageName
}
