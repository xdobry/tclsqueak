IDE::TScriptParsing instproc testHXotclSubobjects {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import xotcl::*

Class B
B instproc b {} {
}
Class A
A instproc a {} {
   B create [self]::@b
}
A instproc b {} {
   my @b b
}
Class C
C instproc foo {} {
   set a [A new]
   [$a @b] b
}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
