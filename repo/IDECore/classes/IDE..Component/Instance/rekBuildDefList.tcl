IDE::Component instproc rekBuildDefList {object objectList} {
    # return the list of classes and objects of this component required
    # to define class (or object) plus class
    # objectList contains already definined classes/objects
    my instvar requiredComp
    #
    # Strangely, a few "objects" come with colon prefixes, some without
    if {$object eq "" || $object eq "::Object" || $object eq "::" || $object eq "xotcl"
	|| [string match "::xotcl::*" $object]
	|| [string match "xotcl::*" $object]
      } return

    if {$object in $objectList} {
        return
    }
    set introProxy [my getIntroProxy]
    set capp [$introProxy getComponentNameForObject $object]
    if {$capp ne [my getName]} {
        if {$capp ni $requiredComp && $capp ne "core" && $capp ne "default"} {
            my addRequiredCompList $capp
        }
        return
    }
    # search for parent object
    set parent [$introProxy getParentForObject $object]
    if {$parent ne "::"} {
        set reqObject [my rekBuildDefList [string trimleft $parent :] $objectList]
    } else {
        set reqObject [list]
    }
    set cl [concat $objectList $reqObject]
    # search if based on own metaclass
    if {[$introProxy isObjectClass $object] && [$introProxy isObjectMetaClass [$introProxy getClassForObject $object]]} {
        lappend reqObject {*}[my rekBuildDefList [string trimleft [$introProxy getClassForObject $object]] $objectList]
    }
    # search for superclasses
    if {[$introProxy isObjectClass $object]} {
        foreach sclass [lsort [$introProxy getSuperclassForClass $object]] {
            if {$sclass eq "::Object"} continue
            set sclass [string trimleft $sclass :]
            lappend reqObject {*}[my rekBuildDefList $sclass [concat $reqObject $cl]]
        }
    }
    return [concat $reqObject $object]
}
