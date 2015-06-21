IDE::TScriptParsing instproc testCFPartCheckingQuote {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
        set a "a[noexists 1]"
    }}
    my assert {[llength [$context set errors]]>0} [$context set errors]
}
