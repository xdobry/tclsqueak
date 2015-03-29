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
