IDE::TScriptParsing instproc testJExprHex {} {
    set context [PrsFileContext new]
    set script {
set a [expr {1+0x30}]
    }

    $context parseGlobal $script
    $context parseGlobal $script

    my assert {[llength [$context set errors]]==0} [$context set errors]

    $context destroy
}
