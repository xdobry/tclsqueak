IDE::TScriptParsing instproc testJBinaryScan {} {
    set context [PrsFileContext new]
    set script {
binary scan abcde\000fghi a6a10 var1 var2
list var1 var2
    }
    $context parseGlobal $script

    my assert {[llength [$context set errors]]==0} [$context set errors]

    $context destroy
}
