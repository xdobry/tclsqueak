IDE::TScriptParsing instproc testKBug18MaxOperator {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
    set a 3
    set b 2
    set m [expr {max($a,$b)}]
    }
    expr {int(max(1,2))}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
