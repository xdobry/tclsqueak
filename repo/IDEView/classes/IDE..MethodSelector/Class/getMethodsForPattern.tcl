IDE::MethodSelector proc getMethodsForPattern patern {
    set mlist [list]
    foreach proxy [IDE::XOIntroProxy getIntroProxies] {
        foreach class [$proxy getClasses]  {
            lappend mlist {*}[$proxy getInstanceMethods $class] {*}[$proxy getClassMethods $class]
        }
        foreach object [$proxy getObjects] {
            lappend mlist {*}[$proxy getClassMethods $object]
        }
    }
    return $mlist
}
