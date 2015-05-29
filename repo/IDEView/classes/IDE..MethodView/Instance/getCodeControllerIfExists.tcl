IDE::MethodView instproc getCodeControllerIfExists {} {
    set codeController [my info parent]::@codecontroller
    if {[Object isobject $codeController]} {
        return $codeController
    }
    return
}
