IDE::TScriptParsing instproc testCEArgumentExpansion {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
        set a {string 1}
        string index {*}$a
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
