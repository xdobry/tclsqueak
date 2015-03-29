IDE::TScriptParsing instproc testHXotcl {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import ::xotcl::*

Class A
Class B

set b [A new]
$b class B
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
    $context parseGlobal {
Class C
C instproc foo {} {
    lsort -command {[self] sort} {1 2 3}
}
    }
    my assert {[llength [$context set errors]]==1}
}
