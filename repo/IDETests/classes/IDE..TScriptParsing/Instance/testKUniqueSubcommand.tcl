IDE::TScriptParsing instproc testKUniqueSubcommand {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a 322
        string range $a 1
    }
    my assert {[llength [$context set errors]]==1} [$context set errors]
    my assert {[string first {expect argument} [lindex [$context set errors] 0]]>0}
}
