PrsMarkupVisitor instproc generateABCIndex indexOut {
    my instvar definitions
    my addNavigation $indexOut
    $indexOut puts "<h1>All symbols in alphabetical order</h1>"
    set indexAll [list]
    set r 0
    foreach d $definitions {
        set type [lindex $d 0 0]
        if {$type eq "proc"} {
            set name [namespace tail [lindex $d 0 1]]
        } elseif {$type eq "method"} {
            set name [lindex $d 0 1 2]
        } elseif {$type eq "object"} {
            set name [namespace tail [lindex $d 0 1]]
        } else {
            set name [namespace tail [lindex $d 0 1]]
        }
        lappend indexAll [list $name $d $r]
        incr r
    }
    set firstChar ""
    foreach elem [lsort -index 0 -nocase $indexAll] {
        lassign $elem name d r
        set currFistChar [string toupper [string index $name 0]]
        if {$currFistChar ne $firstChar} {
            set firstChar $currFistChar
            $indexOut puts "<hr><h2>$firstChar</h2>"
        }
        set type [lindex $d 0 0]
        set defFileName [lindex $d 2]
        set htmlFile [my fileToHtmlFile $defFileName]
        $indexOut puts "<li><a href=\"$htmlFile#r$r\">$name</a> $type"

        if {$type eq "proc"} {
            set fullName [lindex $d 0 1]
            if {[string first : $fullName 2]>0} {
                $indexOut puts " $fullName"
            }
        } elseif {$type eq "method"} {
            lassign [lindex $d 0 1] class mtype method
            $indexOut puts " $class $mtype"
        }
        $indexOut puts {</li>}
    }
}
