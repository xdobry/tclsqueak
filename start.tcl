# automatically generated from XOTclIDE
package provide IDERepoBootstrap 0.1
namespace eval ::repobs {}
proc repobs::asFileName objName {
    string map {:: ..} $objName
}
proc repobs::fileToCompName fileName {
    string map {.. ::} $fileName
}
proc repobs::getAvaialbeComps repodir {
    set comps [list]
    puts "scaning in $repodir"
    foreach d [glob -type d -directory $repodir *] {
        lappend comps [fileToCompName [file tail $d]]
    }
    return $comps
}
proc repobs::getComponent {compName dir {withComments 0}} {
    set source [getSourceFromDir [file join $dir [asFileName $compName]] $withComments]
    return $source
}
proc repobs::getComponentAsPackage {compName dir {withComments 0}} {
    set source ""
    set compDir [file join $dir [asFileName $compName]]
    foreach r [getRequirementsForComponent $compName $dir] {
        append source "package require $r\n"
    }
    set versionInfo [file join $compDir version.info]
    if {[file exists $versionInfo]} {
        set version [string trim [readFile $versionInfo]]
        append source "package provide $compName $version\n"
    } else {
        append source "package provide $compName\n"
    }
    append source [getComponent $compName $dir $withComments]
    return $source
}
proc repobs::getDirElems {repo path} {
    getElemsForType $repo $path d *
}
proc repobs::getElemsForType {repo path type pattern} {
    set dir [file join $repo {*}[getFilePath $path]]
    set elems [list]
    if {![file isdirectory $dir]} {
        return $elems
    }
    set ordfile [file join $dir deforder.repo]
    set readdirs [list]
    if {[file exists $ordfile]} {
        foreach d [readFileAsList $ordfile] {
            set fd [asFileName $d]
            lappend readdirs $fd
            set dname [file join $dir $fd]
            if {$type eq "d"} {
                if {[file isdirectory $dname]} {
                    lappend elems $d
                }
            } else {
                if {[file isfile $dname]} {
                    lappend elems $d
                }
            }
        }
    }
    foreach elem [glob -nocomplain -directory $dir -type $type $pattern] {
        if {[file tail $elem] ni $readdirs} {
            if {$pattern ne "*"} {
                set name [file rootname [file tail $elem]]
            } else {
                set name [fileToCompName [file tail $elem]]
            }
            lappend elems $name
        }
    }
    return $elems
}
proc repobs::getFileElems {repo path {pattern *.tcl}} {
    getElemsForType $repo $path f $pattern
}
proc repobs::getFilePath path {
    set fpath [list]
    foreach p $path {
        lappend fpath [asFileName $p]
    }
    return $fpath
}
proc repobs::getMeta {repo path} {
    set meta [dict create comment {} body {}]
    set fpath [getFilePath $path]
    set fname [lindex $fpath end]
    set of [file join $repo {*}$fpath]
    if {[file isdirectory $of]} {
        set dir $of
    } else {
        set dir [file dirname $of]
    }
    set f [file join $dir $fname.tcl]
    if {[file isfile $f]} {
        dict set meta body [readFile $f]
    }
    set f [file join $dir $fname.txt]
    if {[file isfile $f]} {
        dict set meta comment [readFile $f]
    }
    set f [file join $dir $fname.meta]
    if {[file isfile $f]} {
        set meta [dict merge $meta [readFileAsDict $f]]
    }
    set f [file join $dir version.info]
    if {[file isfile $f]} {
        dict set meta version [string trim [readFile $f]]
    }
    set f [file join $dir require.list]
    if {[file isfile $f]} {
        dict set meta required [readFileAsList $f]
    }
    return $meta
}
proc repobs::getRequirementsForComponent {compName dir} {
    set compDir [file join $dir [asFileName $compName]]
    set reqlist [file join $compDir require.list]
    if {[file exists $reqlist]} {
        return [readFileAsList $reqlist]
    }
    return
}
proc repobs::getSourceFromDir {dir {withComments 0}} {
    variable useCompMeta
    # a hack for loading ide @ is used to align object/classes to component
    set source ""
    foreach f [lsort [glob -nocomplain -directory $dir -types f *.tcl]] {
        if {$withComments} {
            set cfile [file rootname $f].txt
            if {[file exists $cfile]} {
                append source [readFileAsComment $cfile]
            }
        }
        set part [readFile $f]
        append source $part
        if {[string index $part end] ne "\n"} {
            append source \n
        }
    }
    if {$useCompMeta && [lindex [file split $dir] end-1] in {classes objects}} {
        set path [file split $dir]
        set oname [fileToCompName [lindex $path end]]
        append source "@ $oname idemeta component [fileToCompName [lindex $path end-2]]\n"
    }
    set ordfile [file join $dir deforder.repo]
    set readdirs [list]
    if {[file exists $ordfile]} {
        foreach d [readFileAsList $ordfile] {
            set fd [asFileName $d]
            lappend readdirs $fd
            set dname [file join $dir $fd]
            if {[file isdirectory $dname]} {
                set part [getSourceFromDir $dname $withComments]
                append source $part
                if {[string index $part end] ne "\n"} {
                    append source \n
                }
            }
        }
    }
    foreach f [glob -nocomplain -directory $dir -types d *] {
        if {[file tail $f] ni $readdirs} {
            append source [getSourceFromDir $f $withComments]
        }
    }
    foreach f [lsort [glob -nocomplain -directory $dir -types f *.init]] {
        set part [readFile $f]
        append source $part
        if {[string index $part end] ne "\n"} {
            append source \n
        }
    }
    return $source
}
proc repobs::getopts {arguments optiondesc} {
    lappend optiondesc {-repodir string}
    set options [dict create]
    for {set oplen 0} {$oplen<[llength $arguments]} {incr oplen} {
        set arg [lindex $arguments $oplen]
        set found 0
        foreach opt $optiondesc {
            if {[lindex $opt 0] eq $arg} {
                if {[llength $opt]==1} {
                    dict set options [lindex $opt 0] 1
                } else {
                    incr oplen
                    dict set options [lindex $opt 0] [lindex $arguments $oplen]
                }
                set found 1
                break
            }
        }
        if {!$found} {
            break
        }
    }
    foreach opt $optiondesc {
        if {[llength $opt]==1 && ![dict exists $options [lindex $opt 0]]} {
            dict set options [lindex $opt 0] 0
        }
    }
    if {![dict exists $options -repodir]} {
        dict set options -repodir repo
    }
    set repodir [dict get $options -repodir]
    if {![file isdirectory $repodir]} {
        error "can not find repo directory as $repodir. You may also use option -repodir dir"
    }
    list $options [lrange $arguments $oplen end]
}
proc repobs::initPackageLoader repo {
    variable repodir
    set repodir $repo
    package unknown [list repobs::packageUnknownHandler [package unknown]]
}
proc repobs::loadComponent {compName dir} {
    puts "load component $compName"
    loadRequirements $compName $dir
    if {![catch {package present $compName}]} {
        # package already loaded
        return
    }
    set source [getComponent $compName $dir]
    namespace eval :: $source
    package provide $compName 1.0
}
proc repobs::loadRequirements {compName dir} {
    set compDir [file join $dir [asFileName $compName]]
    set reqfile [file join $compDir require.list]
    if {[file isfile $reqfile]} {
        set required [readFileAsList $reqfile]
        foreach p $required {
            puts "loading requirements $p"
            lassign $p pkgName pkgVersion
            set pdir [file join $dir [asFileName $pkgName]]
            if {[file isdirectory $pdir]} {
                loadComponent $p $dir
            } else {
                if {[info exists pkgVersion] && $pkgVersion ne ""} {
                    package require $pkgName $pkgVersion
                } else {
                    package require $pkgName
                }
            }
        }
    }
}
proc repobs::main {} {
    global argv
    if {[llength $argv]==0} {
        main_startide
    } elseif {[lindex $argv 0] in {help -h --help}} {
        main_help
    } else {
        set cmd [lindex $argv 0]
        if {$cmd ni {help dump start export}} {
            puts "unknown command $cmd try 'help' to get help"
        } else {
            main_$cmd {*}[lrange $argv 1 end]
        }
    }
}
proc repobs::main_dump args {
    lassign [getopts $args {-aspackage -nocomments}] options comps
    foreach c $comps {
        if {[dict get $options -aspackage]} {
            puts -nonewline [getComponentAsPackage $c [dict get $options -repodir] [expr {![dict get $options -nocomments]}]]
        } else {
            puts -nonewline [getComponent $c [dict get $options -repodir] [expr {![dict get $options -nocomments]}]]
        }
    }
}
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
proc repobs::main_help {} {
    puts {tclsquak repo tool
supported command:

help : print this help
dump ?-aspackage? ?-nocomments? comp ... : dump repository components to stdout
start ?-require "tcl packages"? ?-script "...." ? comp ... : source and start component. optional script
startide : start IDE from file repository or sqlite repository if exists
export ?-todir directory? ?-nocomments? ?comp ...? : export chosen or all compoents from file repo to direcotry as regular tcl packages
}
}
proc repobs::main_start args {
    lassign [getopts $args {{-require string} {-script string}}] options comps
    set repodir [dict get $options -repodir]
    if {[llength $comps]==0} {
        error "no component paramter to start found."
    }
    if {[dict exists $options -require]} {
        foreach r [dict get $options -require] {
            package require {*}$r
        }
    }
    foreach c $comps {
        loadComponent $c $repodir
    }
    if {[dict exists $options -script]} {
        namespace eval :: [dict get $options -script]
    }
}
proc repobs::main_startide args {
    variable useCompMeta
    lassign [getopts $args {{-xotclidedir string} {-script string}}] options comps
    set repodir [dict get $options -repodir]
    global xotclidedir
    if {![info exists xotclidedir]} {
        if {[dict exists $options -xotclidedir]} {
            set xotclidedir [dict get $options -xoclidedir]   
        } else {
            set xotclidedir [file dirname [info script]]
        }
    }
    namespace eval :: {source [file join $xotclidedir ideCore.tcl]}
    set useCompMeta 1
    set repofile [file join $xotclidedir repository.sql]
    package require XOTcl
    package require Tk
    initPackageLoader $repodir
    package require xdobry::sql
    package require xdobry::sqlite
    package require IDEStart
    Sqlinterface loadInterface sqlite
    if {![file exists $repofile]} {
        set creator [IDEFileRepoToSqliteRepo new]
        $creator createRepo $repodir $repofile
        set connection [$creator exportConnection]
        $creator destroy
    } else {
        set connection [Sqlite new]
        if {[$connection connect [list sqlfile $repofile]]} {
            error "can not open sqlite $repofile"
        }
    }
    IDEStarter startIDEFromConnection $connection
}
proc repobs::packageUnknownHandler {original name args} {
   variable repodir
   set pdir [file join $repodir [asFileName $name]]
   puts "loading $name"
   if {[file isdirectory $pdir]} {
        package ifneeded $name 1.0 [list repobs::loadComponent $name $repodir]
        return
   } else {
       puts "can not load $name fallback $original"
       if {[llength $original]} {
           uplevel 1 $original [::linsert $args 0 $name]
       }
   }
}
proc repobs::readFile file {
    set in [open $file r]
    set source [read $in]
    close $in
    return $source
}
proc repobs::readFileAsComment file {
    set source ""
    set in [open $file r]
    while {[gets $in line]>=0} {
        append source {# } $line \n
    }
    close $in
    return $source
}
proc repobs::readFileAsDict file {
    set meta [dict create]
    set content ""
    set in [open $file r]
    while {[gets $in line]>=0} {
        if {[string index [string trim $line] 0] eq "#"} {
            continue
        }
        append content $line \n
        if {[info complete $content]} {
            lassign $content key value
            dict set meta $key $value
            set content ""
        }
    }
    close $in
    return $meta
}
proc repobs::readFileAsList file {
    set l [list]
    set in [open $file r]
    while {[gets $in line]>=0} {
        lappend l $line
    }
    close $in
    return $l
}
proc repobs::writeFile {file content} {
    set out [open $file w]
    puts -nonewline $out $content
    close $out
}

repobs::main
