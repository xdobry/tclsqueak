IDE::TclKitDeployer instproc readfile name {
    set fd [open $name]
    fconfigure $fd -translation binary
    set data [read $fd]
    close $fd
    return $data
}
