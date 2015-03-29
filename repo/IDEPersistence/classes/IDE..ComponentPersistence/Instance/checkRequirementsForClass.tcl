IDE::ComponentPersistence instproc checkRequirementsForClass class {
    my instvar requiredComp
    set compInScope [concat [my  getRequiredFrom] [my getName]]
    set addReq [list]
    set needReorder 0
    set introProxy [my getIntroProxy]
    set deforder [[$introProxy getDescriptionForObject $class] set deforder]
    # search for depend superclass
    foreach sclass [$introProxy getSuperclassForClass $class] {
         if {$sclass eq "::Object"} continue
         set sclassCompName [$introProxy getComponentNameForObject $sclass]
         if {$sclassCompName ni $compInScope} {
              if {$sclassCompName in {core default}} continue
              lappend addReq $sclassCompName
         }
         if {$sclassCompName eq [my getName] &&
             [[$introProxy getDescriptionForObject $sclass] set deforder]>$deforder
         } {
             set needReorder 1
         }
    }

    # search if based on metaclass
    set compInScope [concat $compInScope $addReq]
    set sclass [$introProxy getClassForObject $class]
    if {[$introProxy isObjectMetaClass $sclass]} {
        set sclassCompName [$introProxy getComponentNameForObject $sclass]
        if {$sclassCompName ni $compInScope} {
            if {$sclassCompName ni {core default}} {
                lappend addReq $sclassCompName
            }
        }
        if {$sclassCompName eq [my getName] &&
            [[$introProxy getDescriptionForObject $sclass] set deforder]>$deforder
        } {
            set needReorder 1
        }
    }
    if {[llength $addReq]>0} {
        my addRequiredCompList $addReq
        IDE::Dialog message "To component [my getName] was added additional Requirements >$addReq<"
        my updateRequired
    }
    if {$needReorder} {
        my reorderObjectDefinition
    }
}
