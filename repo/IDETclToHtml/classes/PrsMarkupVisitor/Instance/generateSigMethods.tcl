PrsMarkupVisitor instproc generateSigMethods {sigOut dicMethods {class {}}} {
    foreach m [lsort [dict keys $dicMethods]] {
        set d [dict get $dicMethods $m]
        set htmlFile [my fileToHtmlFile [lindex $d 1]]
        if {$class ne ""} {
            set classAttr " class=\"$class\""
        } else {
            set classAttr ""
        }
        $sigOut puts "<li><a href=\"$htmlFile#r[lindex $d 0]\" target=\"sourceFrame\"$classAttr>[string trimleft [lindex $d 2] :]</a></li>"
    }
}
