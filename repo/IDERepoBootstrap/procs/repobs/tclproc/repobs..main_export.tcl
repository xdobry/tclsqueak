proc repobs::main_export args {
    lassign [getopts $args {{-todir string} -nocomments}] options comps
    if {[dict exists $options -todir]} {
        set todir [dict get $options -todir]        
    } else {
        set todir packages
    }
    puts "exporting to directory $todir"
    if {![file isdirectory $todir]} {
        puts "direcotry $todir does not exists. create it"
        file mkdir $todir
    }
    if {[llength $comps]==0} {
        set comps [getAvaialbeComps [dict get $options -repodir]]
    }
    foreach c $comps {
        puts "exporting $c"
        set out [getComponentAsPackage $c [dict get $options -repodir] [expr {![dict get $options -nocomments]}]]
        set pfile [file join $todir [asFileName $c].tcl]
        writeFile $pfile $out
    }
}
