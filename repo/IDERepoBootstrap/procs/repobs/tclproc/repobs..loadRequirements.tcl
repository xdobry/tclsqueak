proc repobs::loadRequirements {compName dir} {
    set compDir [file join $dir [asFileName $compName]]
    set reqfile [file join $compDir require.list]
    if {[file isfile $reqfile]} {
        set required [readFileAsList $reqfile]
        foreach p $required {
            puts "loading requirements $p"
            lassign $p pkgName pkgVersion
            set pdir [file join $dir [asFileName $pkgName]]
            if {[file isdirectory $pdir]} {
                loadComponent $p $dir
            } else {
                if {[info exists pkgVersion] && $pkgVersion ne ""} {
                    package require $pkgName $pkgVersion
                } else {
                    package require $pkgName
                }
            }
            if {$pkgName eq "XOTcl"} {
                namespace import ::xotcl::*
           }
        }
    }
}
