IDE::ClassView instproc editSave skript {
    my instvar vcomponent vtype vclass treeView cobj
    if {![my exists vcomponent]} {
        IDE::Dialog message {Select the component first}
        return
    }
    if {![info complete $skript]} {
        IDE::Dialog message {This is not complete Tcl-Script. Check the paratness}
        return
    }
    set introProxy [$cobj getIntroProxy]
    if {[lindex $skript 0] in {Object Class} || [$introProxy isObjectMetaClass [lindex $skript 0]]} {
        set dobj [lindex $skript 1]
        if {[Object isobject [lindex $skript 1]]} {
            if {[IDE::Dialog yesNo "Operation is not permited. All Object methods are lost be redefinig the Object. Use class methods 'superclass' or 'parameter' for redefining. Do you want to use 'Redefine Class Wizard' on $dobj?"] eq "yes"} {
                IDE::ClassDefinition redefineClass $dobj [self]
            }
            return
        }
    }
    # check if component is versioned
    if {![my canModifyComponent]} return

    if {[my isProcView]} {
        $vclass handleDefinitionScript $skript
        return
    }
    set newclass [$introProxy handleObjDefScript $skript]
    if {$newclass eq ""} {
        # Probalbly method definition
        return
    }
    $introProxy moveToComponent $newclass $vcomponent
    if {[$introProxy isObjectClass $newclass]} {
        if {$vtype eq "Classes"} {
            if {$treeView} {
                my changeHeritageView
            } else {
                my addItem $newclass
            }
        }
    } else {
        if {$vtype eq "Objects"} {
            my addItem $newclass
        }
    }
}
