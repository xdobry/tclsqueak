IntroRepoBuilder instproc getMethodsForObject widget {
    set commands [list]
    if {[catch {$widget nocommand} error]} { #ttc noerror
        if {[regexp {must be (.+) or (.+)} $error _ m1 m2]} {
            set m1 [string map [list , ""] $m1]
            #ttc vartype m1 list
            foreach m $m1 {
                lappend commands $m
            }
            lappend commands $m2
        }
    }
    return $commands
}
