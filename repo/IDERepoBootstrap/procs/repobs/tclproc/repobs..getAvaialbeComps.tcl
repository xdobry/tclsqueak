proc repobs::getAvaialbeComps repodir {
    set comps [list]
    puts "scaning in $repodir"
    foreach d [glob -type d -directory $repodir *] {
        lappend comps [fileToCompName [file tail $d]]
    }
    return $comps
}
