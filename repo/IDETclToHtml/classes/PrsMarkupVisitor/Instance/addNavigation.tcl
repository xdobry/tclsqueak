PrsMarkupVisitor instproc addNavigation {out {linksHtml {}}} {
    $out puts "<nav>$linksHtml"
    set outFileName [file tail [$out set fileName]]
    set navDef {
        front.html {Files Overview}
        index-all.html {ABC Index}
        classes.html {Class Tree}
        packages.html {Packages}
    }
    foreach {file name} $navDef {
        if {$outFileName ne $file} {
            $out puts "<a href=\"[$out getRootReference $file]\">$name</a> "
        } else {
            $out puts $name
        }
    }
    $out puts {<a id="errorRef" href="#?">Errors</a>}
    $out puts {</nav>}
}
