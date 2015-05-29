IDE::TScriptParsing instproc testJIndexCheckErrors {} {
    set context [PrsFileContext new]
    set script {
set a 1
set c "hello"
set l [list 1 2 3]
set b [lindex $l $a+a]
set b [lindex $l $a+$c]
    }
    $context parseGlobal $script

    my assert {[llength [$context set errors]]==2} [$context set errors]

    $context destroy
}
