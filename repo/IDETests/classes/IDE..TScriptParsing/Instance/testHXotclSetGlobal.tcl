IDE::TScriptParsing instproc testHXotclSetGlobal {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import xotcl::*
Class A

Class B
B instproc b {} {
    my instvar mya
    set mya [A new]
}
B instproc c {} {
    my instvar mya
    set mya [eval expr 1]
}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
    set repo [$context set repository]
    my assert {[$repo getVariableType ::B instproc mya] eq "xotcl ::A"}
}
