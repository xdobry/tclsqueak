PrsMarkupVisitor instproc generateSignaturesFromDic {sigOut dic} {
    $sigOut puts {<div id="treecontrol"><a href="#?">Collapse All</a> | <a href="#?">Expand All</a></div>}
    if {[dict exists $dic proc]} {
        # TODO order by namespaces
        $sigOut puts "<h4>Procedures</h4>"
        $sigOut puts {<ul class="tv">}
        foreach ns [lsort [dict keys [dict get $dic proc]]] {
            $sigOut puts "<li><div class=\"hita\"></div>$ns"
            $sigOut puts {<ul class="te">}
            my generateSigMethods $sigOut [dict get $dic proc $ns]
            $sigOut puts {</ul>}
            $sigOut puts {</li>}
        }
        $sigOut puts {</ul>}
    }
    if {[dict exists $dic method]} {
        $sigOut puts "<h4>Objects</h4>"
        $sigOut puts {<ul class="tv">}
        foreach object [lsort [dict keys [dict get $dic method]]] {
            set dicObject [dict get $dic method $object]
            set objectName [string trimleft $object :]
            if {[dict exists $dic object $object]} {
                 set d [dict get $dic object $object]
                 $sigOut puts "<li><div class=\"hita\"></div><a href=\"[my fileToHtmlFile [lindex $d 1]]#r[lindex $d 0]\" target=\"sourceFrame\">$objectName</a>"
            } else {
                 $sigOut puts "<li>>$objectName<li>"
            }
            set hasElements 0
            if {[dict exists $dicObject instproc]} {
                set hasElements 1
                $sigOut puts {<ul class="te">}
                my generateSigMethods $sigOut [dict get $dicObject instproc]
            }
            if {[dict exists $dicObject proc]} {
                if {!$hasElements} {
                    $sigOut puts {<ul class="te">}
                }
                my generateSigMethods $sigOut [dict get $dicObject proc] static
                set hasElements 1
            }
            if {$hasElements} {
                $sigOut puts {</ul>}
            }
            $sigOut puts {</li>}
        }
        $sigOut puts {</ul>}
    }
}
