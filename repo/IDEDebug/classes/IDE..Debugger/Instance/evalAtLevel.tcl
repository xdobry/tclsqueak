IDE::Debugger instproc evalAtLevel string {
    my set action [list [self] evalLevel $string]
}
