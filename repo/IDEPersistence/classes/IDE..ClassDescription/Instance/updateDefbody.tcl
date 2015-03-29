IDE::ClassDescription instproc updateDefbody {} {
    my updateAttributes defbody
    [my getComponent] checkRequirementsForClass [my getObject]
}
