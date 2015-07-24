IDE::DeployerUI instproc storeSetting {} {
    my instvar type output components histOutputs startScript kitexe
    IDE::InputCache addValueCache deployouts_$type $output
    IDE::InputCache setValueCache deploydesc_$type [dict create output $output components $components startScript $startScript]
    if {$type eq "exe"} {
        IDE::InputCache setValueCache deploy_kitexe $kitexe
    }

}
