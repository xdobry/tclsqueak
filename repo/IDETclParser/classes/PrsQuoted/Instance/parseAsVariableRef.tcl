PrsQuoted instproc parseAsVariableRef {} {
    set content [my prsContentString]
    # array literal
    # set as($a) 32
    if {[regexp {^[\w:]+\(.+\)$} $content]} {
        my basicParseAsVariableRef
    }
}
