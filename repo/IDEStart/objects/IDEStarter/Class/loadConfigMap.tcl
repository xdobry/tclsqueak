IDEStarter proc loadConfigMap {} {
    my instvar configmap
    if {![my exists configmap]} {
        if {![my exists loaded]} {
            return 0
        }
        return 1
    }
    if {![file exists $configmap]} {
        error "can not find file $configmap"
        return 0
    }
    namespace eval :: "source $configmap"
    global preStartScript startScript componentsToLoad
    if {![info exists componentsToLoad]} {
        error "ill configuration map file"
        return 0
    }
    if {[info exists preStartScript] && $preStartScript!={}} {
        namespace eval :: $preStartScript
    }
    set hasDB [my hasDBConnection]
    foreach comp $componentsToLoad {
        puts "loading component $comp"
        if {[llength $comp]>1 || !$hasDB} {
            set version [lindex $comp 1]
            if {$comp eq "package" || !$hasDB} {
                package require [lindex $comp 0]
            } else {
                my loadComponent [lindex $comp 0] [lindex $comp 1]
            }
        } else {
            my loadComponent $comp
        }
    }
    if {[info exists startScript] && $startScript!={}} {
        namespace eval :: $startScript
    }
    my set loaded 1
    return 1
}
