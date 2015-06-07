proc repobs::main_startide args {
    variable useCompMeta
    variable repodir
    lassign [getopts $args {{-xotclidedir string} {-script string}} 0] options comps
    set repodir [dict get $options -repodir]
    global xotclidedir
    if {![info exists xotclidedir]} {
        if {[dict exists $options -xotclidedir]} {
            set xotclidedir [dict get $options -xotclidedir]   
        } else {
            set xotclidedir [file dirname [info script]]
        }
    }
    set useCompMeta 1
    if {$xotclidedir eq "."} {
        set repofile repository.sql
    } else {
        set repofile [file join $xotclidedir repository.sql]
    }
    set libdir [file join $xotclidedir libs]
    if {[file isdirectory $libdir]} {
        lappend ::auto_path $libdir
    }	
    package require XOTcl
    package require Tk
    namespace eval :: {source [file join $xotclidedir ideCore.tcl]}
    initPackageLoader $repodir
    package require xdobry::sql
    package require xdobry::sqlite
    package require IDEStart
    Sqlinterface loadInterface sqlite
    if {![file exists $repofile]} {
        if {![file isdirectory $repodir]} {
            error "Can not find repo directory and sqlite repository.sql. $repofile is not directory"
        }
        set creator [IDEFileRepoToSqliteRepo new]
        $creator createRepo $repodir $repofile
        set connection [$creator exportConnection]
        $creator destroy
    } else {
        set connection [Sqlite new]
        if {[$connection connect [list sqlfile $repofile]]} {
            error "can not open sqlite $repofile $::errorInfo"
        }
    }
    $connection execute "PRAGMA journal_mode = OFF"
    IDEStarter startIDEFromConnection $connection
}
