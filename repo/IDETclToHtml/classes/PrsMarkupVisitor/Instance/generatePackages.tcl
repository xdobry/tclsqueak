PrsMarkupVisitor instproc generatePackages packageOut {
    my instvar definitions globalRefsArr definitionsKey packageRefs

    my addNavigation $packageOut

    $packageOut puts "<h1>Packages</h1>"

    set packages [list]
    set r 0
    foreach d $definitions {
        set type [lindex $d 0 0]
        set defFileName [lindex $d 2]
        if {$type eq "package"} {
            lappend packages [list [lindex $d 0 1] [lindex $d 2]]
        }
    }
    foreach package [lsort -index 0 $packages] {
        lassign $package name file
        $packageOut puts <ul>
        $packageOut puts "<li><a href=\"[my fileToHtmlFile $file]\">$name</a> $file</li>"
        if {![catch {set packageRefs($file)} reqPackages]} {
            $packageOut puts <ul>
            foreach p $reqPackages {
                $packageOut puts "<li>$p</li>"
            }
            $packageOut puts </ul>
        }
        $packageOut puts </ul>
   }

}
