proc repobs::getAvaialbeComps repodir {
    set comps [list]
    puts "file repo is: $repodir"
    foreach d [glob -type d -directory $repodir *] {
        lappend comps [fileToCompName [file tail $d]]
    }
    return $comps
}
