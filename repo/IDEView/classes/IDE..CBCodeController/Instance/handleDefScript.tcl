IDE::CBCodeController instproc handleDefScript {skript {contentDesc {}}} {
    lassign $contentDesc vclass type vcomponent
    set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
    if {$cobj eq ""} {
        IDE::Dialog message "can not find component $vcomponent for type def script"
        return
    }
    set introProxy [$cobj getIntroProxy]
    # TODO XOTcl specific
    if {[lindex $skript 0] in {Object Class} || [$introProxy isObjectMetaClass [lindex $skript 0]]} {
        if {[lindex $skript 1] eq "create"} {
            set dobj [lindex $skript 2]
        } else {
            set dobj [lindex $skript 1]
        }
        if {[Object isobject $dobj]} {
            if {[IDE::Dialog yesNo "Operation is not permited. All Object methods are lost be redefinig the Object. Use class methods 'superclass' or 'parameter' for redefining. Do you want to use 'Redefine Class Wizard' on $dobj?"] eq "yes"} {
                IDE::ClassDefinition redefineClass $dobj [self] $cobj
            }
            return
        }
    }
    # check if component is versioned
    if {![my canModifyComponent $cobj]} return

    set newclass [$introProxy handleObjDefScript $skript]
    if {$newclass eq ""} {
        # Probalbly method definition
        return
    }
    $introProxy moveToComponent $newclass $vcomponent
    set item [list $newclass $type $vcomponent]
    my showNavigation $item
    return $item
}
