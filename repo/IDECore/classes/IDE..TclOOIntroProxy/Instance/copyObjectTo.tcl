IDE::TclOOIntroProxy instproc copyObjectTo {object newname} {
    set defscript [my getObjDef $object]
    set defscript [lreplace $defscript 2 2 $newname]
    namespace eval :: $defscript
    if {[info object isa class $newname]} {
        foreach m [my getInstanceMethods $object] {
            namespace eval :: [lreplace [my getBodyInstanceMethod $object $m] 1 1 $newname]
        }
    }
    foreach m [info object methods $object] {
       namespace eval :: [lreplace [my getBodyClassMethod $object $m] 1 1 $newname]
    }
    return $newname
}
