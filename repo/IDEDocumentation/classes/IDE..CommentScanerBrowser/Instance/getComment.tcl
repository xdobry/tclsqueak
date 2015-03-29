IDE::CommentScanerBrowser instproc getComment {} {
    my instvar handler pLine commentBody
    set commentBody {}
    set line [string trim [gets $handler]]
    while {![eof $handler] && $line ne "" && [string index $line 0] eq "#"} {
        append commentBody [string trimleft $line "\#\t "] \n
        set line [string trim [gets $handler]]
    }
    set pLine $line
}
