IDE::TScriptParsing instproc testZBWasErrorVResolution {} {
    set context [PrsFileContext new -childof [self]]
    set prog {
package require XOTcl

namespace import xotcl::*

Class RA
RA instproc foo {a} {
   my instvar mya
   set mya $a
}

RA instproc bar {} {
    set a [my info parent]
    my bar2 $a
}

RA instproc bar2 {a} {
    my foo $a
    }
}
    $context parseGlobal $prog
    $context parseGlobal $prog
    set repo [$context set repository]
    [$repo getWriteRepository] resolveTypes
    my assert {[$repo getVariableType ::RA instproc mya] eq "xotcl"}
}
