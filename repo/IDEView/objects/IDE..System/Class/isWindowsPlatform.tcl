IDE::System proc isWindowsPlatform {} {
    global tcl_platform
    expr {$tcl_platform(platform) eq "windows"}
}
