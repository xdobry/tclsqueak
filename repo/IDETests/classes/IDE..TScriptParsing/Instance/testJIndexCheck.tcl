IDE::TScriptParsing instproc testJIndexCheck {} {
    set context [PrsFileContext new]
    set script {
set a 1
set c 2
set l {1 2 3 4}
set b [lindex $l 0]
set b [lindex $l $a+1]
set b [lindex $l end-$a]
set b [lindex $l $a-1]
set b [lindex $l $a+$b]
set b [lindex $l $a-$b]
set b [lindex $l [lindex $l 0]+1]
    }

    $context parseGlobal $script
    $context parseGlobal $script

    my assert {[llength [$context set errors]]==0} [$context set errors]

    $context destroy
}
