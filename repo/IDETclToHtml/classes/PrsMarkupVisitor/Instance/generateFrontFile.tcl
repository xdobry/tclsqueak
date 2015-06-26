PrsMarkupVisitor instproc generateFrontFile frontOut {
    my instvar definitions files errors

    my addNavigation $frontOut
    $frontOut puts "<h1>Files Overview</h1>"

    set r 0
    set dicproc [dict create]
    set dicmethod [dict create]
    set dicobject [dict create]
    set dicerrors [dict create]
    set cproc 0
    set cmethod 0
    set cobject 0
    set cerrors 0

    foreach d $definitions {
        set type [lindex $d 0 0]
        set defFileName [lindex $d 2]
        if {$type eq "proc"} {
            dict incr dicproc $defFileName
            incr cproc
        } elseif {$type eq "method"} {
            dict incr dicmethod $defFileName
            incr cmethod
        } elseif {$type eq "object"} {
            dict incr dicobject $defFileName
            incr cobject
        }
    }
    foreach d $errors {
        dict incr dicerrors [lindex $d 0]
        incr cerrors
    }

    $frontOut puts {<table class="fileOverview">}
    $frontOut puts {<tr><th>File</th><th>procs</th><th>objects</th><th>methods</th><th>errors</th></tr>}

    foreach file [lsort -unique $files] {
        $frontOut puts {<tr><td>}
        $frontOut puts "<a href=\"[my fileToHtmlFile $file]\">$file</a>"
        $frontOut puts {</td><td>}
        if {[dict exists $dicproc $file]} {
            $frontOut puts [dict get $dicproc $file]
        }
        $frontOut puts {</td><td>}
        if {[dict exists $dicobject $file]} {
            $frontOut puts [dict get $dicobject $file]
        }
        $frontOut puts {</td><td>}
        if {[dict exists $dicmethod $file]} {
            $frontOut puts [dict get $dicmethod $file]
        }
        $frontOut puts {</td><td>}
        if {[dict exists $dicerrors $file]} {
            $frontOut puts [dict get $dicerrors $file]
        }
        $frontOut puts {</td></tr>}
    }
    $frontOut puts {<tr><td>sum</td>}
    $frontOut puts "<td>$cproc</td><td>$cobject</td><td>$cmethod</td><td>$cerrors</td></tr>"
    $frontOut puts "</table>"
    $frontOut puts "<hr><small>
generated on [clock format [clock seconds]] by <a href=\"http://www.xdobry.de/ttclcheck\" target=\"_parent\">ttclcheck</a>
<a href=\"http://www.gnu.org\" target=\"_parent\">GPL</a> Software.
(Powered by <a href=\"http://www.tcl.tk\" target=\"_parent\">Tcl</a> and <a href=\"http://www.xotcl.org\" target=\"_parent\">XOTcl</a>)\"
</small>"
}
