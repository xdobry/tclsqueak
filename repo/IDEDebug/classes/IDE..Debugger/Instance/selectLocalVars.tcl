IDE::Debugger instproc selectLocalVars item {
    my set action [list [self] showLocalVar $item]
}
