IDE::TestCase instproc getTestDir {} {
    # get test dir. /tmp for unix nothing for else
    global tcl_platform
    if {$tcl_platform(platform) eq "unix"} {
        return /tmp
    } else {
        return
    }
}
