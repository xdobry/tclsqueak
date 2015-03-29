IDE::MethodView instproc selectHItem hitem {
    [my info parent]::methodedit setBodyTextControler {*}$hitem [self]
}
