IDE::CommentScanerBrowser instproc skipEmptyLines line {
    my instvar handler
    while {[string trim $line] eq ""} {
        if {[gets $handler line] == -1} {
            break
        }
    }
    return $line
}
