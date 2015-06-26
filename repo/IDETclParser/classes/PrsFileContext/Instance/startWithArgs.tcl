PrsFileContext instproc startWithArgs arguments {
    my instvar repository
    if {[llength $arguments]==0} {
        my putsArgHelp
        exit 0
    }
    my putsProgLicense
    set files [list]
    set out ""
    set repositoryFile ""
    set writeRepositoryFile ""
    for {set i 0} {$i<[llength $arguments]} {incr i} {
        set elem [lindex $arguments $i]
        if {$elem eq "-out"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -out"
            }
            set outfile [lindex $arguments $i]
            set out [open $outfile w]
            my setOutStream $out
        } elseif {$elem eq "-i"} {
            set coreRepository [$repository getCoreRepository]
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -i"
            }
            puts "loading core signatures from [lindex $arguments $i]"
            $coreRepository loadRepository [lindex $arguments $i]
        } elseif {$elem eq "-r"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -r"
            }
            set repositoryFile [lindex $arguments $i]
            if {[file isfile $repositoryFile]} {
                puts "loading signatures from [lindex $arguments $i]"
                set writeRepository [$repository getWriteRepository]
                $writeRepository loadRepository [lindex $arguments $i]
            } else {
                puts "can not find repository [lindex $arguments $i]"
            }
        } elseif {$elem eq "-l"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -l"
            }
            set reposDir [lindex $arguments $i]
            if {![file isdirectory $reposDir]} {
                error "can not find repo directory from argument -l $reposDir"
            }
            [$repository getCoreRepository] setReposDir [lindex $arguments $i]
        } elseif {$elem eq "-log"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -log"
            }
            tlog::setLogLevel [lindex $arguments $i]
        } elseif {$elem eq "-req"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -log"
            }
            set coreRepository [$repository getCoreRepository]
            $coreRepository loadRepoForPackage [lindex $arguments $i]
        } elseif {$elem eq "-w"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -w"
            }
            set writeRepositoryFile [lindex $arguments $i]
        } elseif {$elem eq "-scan"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -scan"
            }
            set dir [lindex $arguments $i]
            if {![file isdirectory $dir]} {
                error "expect paramter as directory $dir"
            }
            lappend files {*}[my scanTclFiles $dir]
        } elseif {$elem eq "-devel"} {
            TclParser setDevelMode 1
        } elseif {$elem eq "-encoding"} {
            incr i
            if {$i>=[llength $arguments]} {
                error "expect argument for option -encoding"
            }
            encoding system [lindex $arguments $i]
        } elseif {$elem eq "-html"} {
            my startGenerateHtml
        } elseif {$elem eq "-notypes"} {
            PrsCheckerOptions set checkTypes 0
        } elseif {$elem eq "-oldstringop"} {
            PrsCheckerOptions set oldStringOp 1
        } elseif {$elem in {-h -help}} {
            my putsArgHelp
            exit 0
        } else {
            set argParsed [my parseArgs [lrange $arguments $i end]]
            if {$argParsed>0} {
                incr i [expr {$argParsed-1}]
            } else {
                lappend files $elem
            }
        }
    }
    if {[llength $files]==0} {
        error "no files as parameter found"
    }
    my parseFiles $files
    if {$out ne ""} {
        close $out
    }
    if {$repositoryFile ne ""} {
        set writeRepository [$repository getWriteRepository]
        puts "writing signatures to $repositoryFile"
        $writeRepository safeRepository $repositoryFile
    }
    if {$writeRepositoryFile ne ""} {
        set writeRepository [$repository getWriteRepository]
        puts "writing signatures to $writeRepositoryFile"
        $writeRepository safeRepository $writeRepositoryFile
    }
}
