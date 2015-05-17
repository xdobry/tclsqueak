IDE::XOIntroProxy instproc copyObjectTo {object newname} {
    set defscript [my getObjDef $object]
    set defscript [lreplace $defscript 2 2 $newname]
    namespace eval :: $defscript
    if {[Object isclass $newname]} {
        foreach m [$object info instprocs] {
            namespace eval :: [lreplace [my getBodyInstanceMethod $object $m] 0 0 $newname]
        }
    }
    foreach m [$object info procs] {
       namespace eval :: [lreplace [my getBodyClassMethod $object $m] 0 0 $newname]
    }
    return $newname
}
