IDE::TclOOCheckerTest instproc testATclOOVariableSeperated {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    variable v1 v2 v3 v4
}
oo::define fruit method foo {} {
    list $v1 $v2 $v3 $v4
}

    }
    set repository [[$context set repository] getWriteRepository]
    set parameter [$repository getClassParameters ::fruit]
    my assert {"v1" in $parameter && "v2" in $parameter && "v3" in $parameter && "v4" in $parameter}
    my assert {[$repository getVariableType ::fruit instproc v1] ne ""}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
