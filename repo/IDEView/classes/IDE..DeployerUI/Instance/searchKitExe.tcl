IDE::DeployerUI instproc searchKitExe {} {
    if {[IDE::System isWindowsPlatform]} {
        set pattern tclkit*win32*.exe
    } else {
        set pattern tclkit*rhel5*
    }
    lindex [glob -nocomplain -directory [IDE::System getSystemDir] $pattern] 0
}
