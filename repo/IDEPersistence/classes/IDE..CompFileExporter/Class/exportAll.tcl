IDE::CompFileExporter proc exportAll {} {
    global xotclidedir
    set exp [IDE::CompFileExporter new]
    set isatk 0
    if {[file isdirectory repo]} {
        set dir repo
    } else {
        set isatk 1
        set dir [file join .. tclsqueak repo]
        if {![file isdirectory $dir]} {
            error "can not find repo dir"
        }
    }
    set time [clock seconds]
    foreach c [IDE::Component getAllComponents] {
        if {[$c isPersistent]} {
            $exp exportCompObj $c $dir 1
        }
    }
    $exp destroy
    if {$isatk} {
        set bobj [IDE::Component getCompObjectForNameIfExist IDERepoBootstrap]
        if {$bobj ne ""} {
            set out [open [file join [file dirname $dir] start.tcl] w]
            puts $out [$bobj asScript 1]
            puts $out repobs::main
            close $out
        }
        file copy -force [file join $xotclidedir ideCore.tcl] [file dirname $dir]
    }
}
