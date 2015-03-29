IDE::TScriptParsing instproc testBBExpParsing {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {} {
    set a 1
    set b [expr {$a+1}]
    return $b
}
    }
    my assert {[llength [$context set errors]]==0}
    set repository [$context set repository]
    set desc [$repository getCommandDescription foo]
    my assert {$desc ne ""}
    my assert {[lindex $desc 1 0 0] eq "int"}
}
