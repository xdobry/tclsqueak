IDE::TScriptParsing instproc testZBWasErrorVResolution2 {} {
    set context [PrsFileContext new -childof [self]]
    set prog {
package require XOTcl

namespace import xotcl::*

Class A
A instproc foo {} {
}
Class AS1 -superclass A
Class AS2 -superclass A


Class B
B instproc b {a} {
    $a foo
}
B instproc b2 {a} {
    my b $a
}
B instproc b3 {a} {
    my b2 $a
}
B instproc c {} {
    set mya [AS1 new]
    my b3 $mya
}
B instproc d {} {
    set mya [AS2 new]
    my b2 $mya
}

}
    set repo [$context set repository]
    $context parseGlobal $prog
    $context initPass2
    [$repo getWriteRepository] resolveTypes
    $context parseGlobal $prog
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
