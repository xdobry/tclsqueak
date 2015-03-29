IDE::TScriptParsing instproc testCBCatchVariableSet {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    set c ""
    catch {open file r} c
    close $c
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
