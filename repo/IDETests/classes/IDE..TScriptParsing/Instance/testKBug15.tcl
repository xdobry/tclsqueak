IDE::TScriptParsing instproc testKBug15 {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
    package require XOTcl
    namespace import ::xotcl::*
    Class create MClass
    Mclass proc getSystemDir {} { return 1 }
    proc foo {a} {
        MClass proc getSystemDir
    }}
    my assert {[llength [$context set errors]]>0} [$context set errors]
}
