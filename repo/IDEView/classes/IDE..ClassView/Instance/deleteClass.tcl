IDE::ClassView instproc deleteClass actual {
    my instvar vtype vcomponent procsGroup

    set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
    if {$cobj eq ""} return
    set introProxy [$cobj getIntroProxy]
    if {$vtype eq "Classes"} {
        set dependClasses [$introProxy getDependClasses $actual]
        if {[llength $dependClasses]>0} {
            IDE::Dialog message "$actual has dependend classes and can not be removed yet: [join $dependClasses {, }]. Remove the class dependiences first"
            return
        }
    }
    if {![my canModifyComponent]} return
    if {![IDE::Dialog yesNo "Do you really want to delete $actual"]} return
    my removeItem $actual
    if {[my isProcView]} {
        $cobj removeProcsGroup $procsGroup
    } else {
        set introProxy [my getIntroProxy]
        if {[$introProxy isObjectClass $actual]} {
            $cobj removeClass $actual
        } else {
            $cobj removeObject $actual
        }
        $introProxy unloadObject $actual
    }
    [my info parent]::methodcatview selectFor {} $vtype {}
}
