IDE::Component instproc copyClassOrObject {object newname {compName {}}} {
    # TODO XOTcl specific and deprectated
    set introProxy [my getIntroProxy]
    set defscript [$introProxy getObjDef $object]
    set defscript [lreplace $defscript 1 1 $newname]
    namespace eval :: $defscript
    if {[Object isclass $newname]} {
        foreach m [$object info instprocs] {
            namespace eval :: [lreplace [$introProxy getBodyInstanceMethod $object $m] 0 0 $newname]
        }
    }
    foreach m [$object info procs] {
       namespace eval :: [lreplace [$introProxy getBodyClassMethod $object $m] 0 0 $newname]
    }
    if {$compName eq ""} {
        set compName [my getName]
    }
    $introProxy moveToComponent $newname $compName
}
