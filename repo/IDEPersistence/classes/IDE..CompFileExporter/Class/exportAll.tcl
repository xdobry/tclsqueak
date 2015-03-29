IDE::CompFileExporter proc exportAll {} {
    global xotclidedir
    set exp [IDE::CompFileExporter new]
    set dir [file join .. tclsqueak repo]
    set time [clock seconds]
    foreach c [IDE::Component getAllComponents] {
        if {[$c isPersistent]} {
            $exp exportCompObj $c $dir
        }
    }
    $exp cleanUpRepo $dir $time
    $exp destroy
    set bobj [IDE::Component getCompObjectForName IDERepoBootstrap]
    set out [open [file join [file dirname $dir] start.tcl] w]
    puts $out [$bobj asScript 1]
    puts $out repobs::main
    close $out
    file copy -force [file join $xotclidedir ideCore.tcl] [file dirname $dir]
}
