IDE::TSignatureRepo instproc testFAGlobalVariablesSupperclass {} {
    my instvar repo

    $repo registerObject ::CS Class {} {}
    my assert {[$repo isXotclClass ::CS]}
    $repo registerObject ::CA Class ::CS {}
    $repo registerObject ::CB Class ::CS {}
    my assert {"::CS" in [$repo getFullHeritage ::CA]}
    my assert {"::CS" in [$repo getFullHeritage ::CB]}

    $repo registerVariable {} global myc {} [list xotcl ::CA]
    my assert {[$repo getVariableType {} global myc] eq "xotcl ::CA"}
    $repo registerVariable {} global myc {} int 0
    my assert {[$repo getVariableType {} global myc] eq "xotcl ::CA"}
    $repo registerVariable {} global myc {} [list xotcl ::CB] 1
    my assert {[$repo getVariableType {} global myc] eq "xotcl ::CS"}
}
