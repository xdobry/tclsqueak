IDE::TScriptParsing instproc testCCupvar {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    upvar #0 _$a abb
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
