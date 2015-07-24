IDE::TclKitDeployer instproc startScriptInvocation compToSave {
    my instvar isXOTclcode nopackages onefile
    set script {package require starkit
starkit::startup
set progdir $::starkit::topdir
}

    set initialized [list]
    foreach comp $compToSave {
        foreach s [$comp getSystemRequirements] {
            if {$s ni $initialized} {
                append script "package require " $s \n
                if {$s eq "XOTcl"} {
                    append script "namespace import xotcl::* \n"
                    set isXOTclcode 1
                }
                lappend initialized $s
            }
        }
    }
    
    if {!$nopackages && !$onefile} {
       append script {lappend auto_path $::starkit::topdir} \n
    } 
    return $script
}
