IDE::DeployerUI instproc getDeploymentDescription {} {
    my instvar type output components startScript kitexe
    set desc [dict create output $output components $components startScript $startScript]
    set rtype $type
    if {$rtype eq "exe"} {
        if {[IDE::System isWindowsPlatform]} {
            set rtype win
        } else {
            set rtype linux
        }
        dict set desc kitexe $kitexe
    }
    dict set desc type $rtype    
    return $desc
}
