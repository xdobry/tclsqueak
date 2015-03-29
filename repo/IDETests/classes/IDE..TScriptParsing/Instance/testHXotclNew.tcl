IDE::TScriptParsing instproc testHXotclNew {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require XOTcl

namespace import ::xotcl::*

Class A
A instproc foo {} {
    return foo
}

set a [A new]
$a fooUnknown
    }

    my assert {[llength [$context set errors]]>0} [$context set errors]
}
