IDE::DeployerUI instproc searchStartScripts {} {
    my instvar components
    set scripts [list]
    foreach c $components {
        set cobj [IDE::Component getCompObjectForNameIfExist $c]
        set introProxy [$cobj getIntroProxy]
        foreach class [$cobj getClasses] {
            foreach m [$introProxy getClassMethods $class] {
                if {$m eq "main"} {
                    set script "$class main"
                    lassign [$introProxy getMethodParamDescForObject $class $m] arguments defcount
                    if {[llength $arguments]==1} {
                        append script { $argv}
                    }
                    lappend scripts $script
                }
            }
        }
        foreach class [$cobj getObjects] {
            foreach m [$introProxy getClassMethods $class] {
                if {$m eq "main"} {
                    set script "$class main"
                    lassign [$introProxy getMethodParamDescForObject $class $m] arguments defcount
                    if {[llength $arguments]==1} {
                        append script { $argv}
                    }
                    lappend scripts $script
                }
            }
        }
        foreach pgroup [$cobj getProcsGroupsObjects] {
            foreach m [$pgroup getProcsNames] {
                if {[string match main_* $m]} {
                    if {[llength [info args $m]]==1} {
                        lappend scripts "$m \$argv"
                    } else {
                        lappend scripts "$m"
                    }
                }
            }
        }
    }
    return $scripts
}
