IDE::CommentScanerBrowser instproc getCommand {} {
    my instvar handler pLine commandBody
    set pLine [my skipEmptyLines $pLine]
    set commandBody $pLine
    append commandBody \n
    while {![eof $handler] && ![info complete $commandBody]} {
        append commandBody [gets $handler] \n
    }
}
