IDE::ClassDescription instproc updateDefbody {{checkRequirements 1} {registerDefMethod 1}} {
    my updateAttributes defbody
    if {$checkRequirements} {
       [my getComponent] checkRequirementsForClass [my getObject]
    }
    if {$registerDefMethod} {
        my registerDefMethod
    }
}
