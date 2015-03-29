IDE::TkWinList instproc packerConfigurationString {win manager root} {
    set text ""
    array set defarr {
        -anchor center
        -expand 0
        -fill none
        -ipadx 0
        -ipady 0
        -padx 0
        -pady 0
        -side top
        -columnspan 0
        -rowspan 0
        -sticky {}
        -bordermode inside
    }
    if {$manager eq "place"} {
        set defarr(-anchor) nw
    }
    foreach {opt value} [$manager info $win] {
        if {[info exists defarr($opt)] && $defarr($opt)==$value} continue
        if {$opt eq "-in"} {
            if {$value!=[winfo parent $win]} {
                if {![regsub -all -- $root $value \$win value]} {
                    return "### gemetry window $value not child of $root"
                }
                append text " $opt $value"
            }
        } else {
            append text " $opt $value"
        }
    }
    return $text
}
