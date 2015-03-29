IDE::TScriptParsing instproc testHXotclSetHeritage {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import xotcl::*
Class A
Class AS1 -superclass A
Class AS2 -superclass A

Class B
B instproc b {} {
    my instvar mya
    set mya [AS1 new]
}
B instproc c {} {
    my instvar mya
    set mya [AS2 new]
}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
    set repo [$context set repository]
    my assert {[$repo getVariableType ::B instproc mya] eq "xotcl ::A"}
}
