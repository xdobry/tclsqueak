IDE::Debugger instproc substituteAtLevel string {
    my set action [list [self] substituteLevel $string]
}
