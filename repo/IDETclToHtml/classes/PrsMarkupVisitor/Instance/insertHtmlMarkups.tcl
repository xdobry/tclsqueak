PrsMarkupVisitor instproc insertHtmlMarkups {content out} {
    my instvar markups fileName currentDefs definitionsKey currentRefs definitions
    set insertions [list]
    set insertionsEnd [list]

    foreach d $currentDefs {
        set r [lsearch $definitionsKey $d]
        if {$r>=0} {
            lappend insertions [list [lindex $definitions $r 1] "<a name=\"r$r\">"]
            lappend insertions [list [expr {[lindex $definitions $r 1]}] "</a>"]
        }
    }

    foreach m $markups {
        lassign $m begin end markup varType varIndex

        if {$varIndex ne ""} {
            set dataVarIndex " data-vindex=\"$varIndex\""
        } else {
            set dataVarIndex ""
        }
        if {$markup eq "error"} {
            lappend insertions [list $begin "<a class=\"$markup\" name=\"e$varIndex\" data-type=\"$varType\">"]
            lappend insertionsEnd [list [expr {$end+1}]  "</a>"]

        } else {
            if {$varType ne ""} {
                lappend insertions [list $begin "<span class=\"$markup\" data-type=\"$varType\"$dataVarIndex>"]
            } else {
                lappend insertions [list $begin "<span class=\"$markup\"$dataVarIndex>"]
            }
            lappend insertionsEnd [list [expr {$end+1}]  "</span>"]
        }
    }
    foreach ref $currentRefs {
        lassign $ref key begin end methodDesc
        set r [lsearch $definitionsKey $key]
        if {$r>=0} {
            set refFileName [lindex $definitions $r 2]
            if {$refFileName ne $fileName && $refFileName ne ""} {
                set url [my fileToRelativeHtmlFile $out $refFileName]
            } else {
                set url ""
            }
            append url #r$r
            if {$methodDesc ne ""} {
                lappend insertions [list $begin "<a href=\"$url\" title=\"[my methodDescToHuman $methodDesc]\">"]
            } else {
                lappend insertions [list $begin "<a href=\"$url\">"]
            }
            lappend insertions [list [expr {$end+1}] "</a>"]
        } else {
            set coreLink [my getCoreLinkForKey $key]
            if {$coreLink ne ""} {
                lappend insertions [list $begin "<a class=\"ext\" href=\"$coreLink\" target=\"_blank\">"]
                lappend insertions [list [expr {$end+1}] "</a>"]
            }
        }
    }
    # the tags should be nested if on one element <b><a>content</a></b> not <b><a>content</b></a>
    lappend insertions {*}$insertionsEnd


    set insertions [lsort -index 0 -integer $insertions]
    set start 0
    set ret ""
    foreach i $insertions {
        lassign $i pos icontent
        if {$pos>0} {
            append ret [string map {> &gt; < &lt; & &amp; \t "    "} [string range $content $start [expr {$pos-1}]]]
        }
        append ret $icontent
        set start $pos
    }
    append ret [string map {> &gt; < &lt; & &amp; \t "    "} [string range $content $start end]]
    $out putsNonewline $ret
}
