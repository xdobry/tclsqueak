IDE::TScriptParsing instproc testHXotclOverrideVariable {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import xotcl::*

Class B
B instproc foo {p} {
    my instvar p
}
    }
    set repository [[$context set repository] getWriteRepository]
    my assert {[llength [$context set errors]]>0} [$context set errors]
}
