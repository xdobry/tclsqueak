IDE::GuiClassBuilder instproc copyTemplateMethods {fromClass toClass introProxy desc} {
    set xintroProxy [IDE::XOIntroProxy getIntroProxy]
    set ootype [dict get $desc ooSystemType]
    foreach classMethods [$xintroProxy getClassMethods $fromClass] {
        set body [$xintroProxy getBodyClassMethod $fromClass $classMethods]
        set body [lreplace $body 0 0 $toClass]
        set body [lreplace $body end end [my applyTemplate [lindex $body end] $desc]]
        if {$ootype ne "XOTcl"} {
            set body [my convertMethodDefForOOType $body $ootype]
        }
        $introProxy handleScript $body
    }
    foreach instMethods [$xintroProxy getInstanceMethods $fromClass] {
        set body [$xintroProxy getBodyInstanceMethod $fromClass $instMethods]
        set body [lreplace $body 0 0 $toClass]
        set body [lreplace $body end end [my applyTemplate [lindex $body end] $desc]]
        if {$ootype ne "XOTcl"} {
            set body [my convertMethodDefForOOType $body $ootype]
        }
        $introProxy handleScript $body
    }
    set introProxy 
}
