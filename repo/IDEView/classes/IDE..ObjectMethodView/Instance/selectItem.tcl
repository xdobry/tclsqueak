IDE::ObjectMethodView instproc selectItem method {
    my instvar vclass vtype vobject introProxy
    if {$method eq "" || ![$introProxy isObject $vobject]} return
    set def [$introProxy getMethodItemDescFromObjectMethod $vobject $method]
    if {[llength $def]==0} {
        set body "# no access to $def"
        [my info parent]::methodedit setTextControler $body [self]
        return
    }
    lassign $def class type method
    [my info parent]::methodedit setBodyTextControler $class $type $method [self]
}
