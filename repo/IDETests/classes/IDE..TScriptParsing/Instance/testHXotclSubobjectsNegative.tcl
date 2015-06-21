IDE::TScriptParsing instproc testHXotclSubobjectsNegative {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import xotcl::*

Class B
B instproc b {} {
}
Class A
A instproc a {} {
   B create [self]::b
}
A instproc b {} {
   my b b unknownParam
}
    }
    set repository [[$context set repository] getWriteRepository]
    my assert {[llength [$context set errors]]>0} [$context set errors]
}
