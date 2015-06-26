IDE::TScriptParsing instproc testJScan {} {
    set context [PrsFileContext new]
    set script {
set char "x"
set value [scan $char %c]
scan $char %c v
set v
    }
    $context parseGlobal $script

    my assert {[llength [$context set errors]]==0} [$context set errors]

    $context destroy
}
