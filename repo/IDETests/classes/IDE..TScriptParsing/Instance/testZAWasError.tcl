IDE::TScriptParsing instproc testZAWasError {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl
namespace import ::xotcl::*
Class A

A instproc a(1) {
    # proc without aguments
}
    }
    my assert {[llength [$context set errors]]==1} [$context set errors]
}
