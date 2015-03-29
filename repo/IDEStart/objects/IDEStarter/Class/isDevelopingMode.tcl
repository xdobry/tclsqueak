IDEStarter proc isDevelopingMode {} {
    if {[my exists isDevelopingMode]} {
        return [my set isDevelopingMode]
    } else  {
        return 1
    }
}
