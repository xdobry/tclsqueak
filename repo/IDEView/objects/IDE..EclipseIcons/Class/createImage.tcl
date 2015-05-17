IDE::EclipseIcons proc createImage name {
    set methodName [my getMethodName $name]
    if {[my info procs $methodName] ne ""} {
        my $methodName
        return 1
    }
    return 0

}
