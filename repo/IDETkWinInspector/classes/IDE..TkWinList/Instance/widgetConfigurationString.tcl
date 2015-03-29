IDE::TkWinList instproc widgetConfigurationString {w root} {
    set text ""
    foreach conf [$w configure] {
        if {[lindex $conf 3]==[lindex $conf 4]} continue
        set cname [lindex $conf 0]
        if {[winfo class $w] eq "Toplevel" && $cname eq "-menu"} continue
        if {[lsearch [list -command -yscrollcommand -xscrollcommand] $cname]>=0} {
           regsub -all -- $root [lindex $conf 4] \$win erg
           append text " $cname \[list $erg\]"
        } else {
           append text " $cname [list [lindex $conf 4]]"
        }
    }
    return $text
}
