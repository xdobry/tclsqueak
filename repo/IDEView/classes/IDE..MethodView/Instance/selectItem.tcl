IDE::MethodView instproc selectItem method {
    my instvar vclass vtype actItem inheritedMethod
    set actItem {}
    if {$method eq ""} {
        # [my info parent]::methodedit setTextControler {} [self]
        return
    }
    set introProxy [my getIntroProxy]
    if {$inheritedMethod && $vtype eq "Instance"} {
        foreach c [concat $vclass [$introProxy getHeritageFlatPrecedenceForClass $vclass]] {
            if {$method in [$introProxy getInstanceMethods $c]} {
                set actItem [list $c [$introProxy getSpecialMethodType $vtype] $method]
                break
            }
        }
    } else {
        set actItem [list $vclass [$introProxy getSpecialMethodType $vtype] $method]
    }
    my addItemToHistory $actItem
    my refreshView
}
