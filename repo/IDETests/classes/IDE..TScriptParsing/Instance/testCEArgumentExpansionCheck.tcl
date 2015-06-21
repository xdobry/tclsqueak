IDE::TScriptParsing instproc testCEArgumentExpansionCheck {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
        set a [list 1 2 3]
        list {*}[noexists 1]
    }}
    my assert {[llength [$context set errors]]>0} [$context set errors]
}
