IDE::ClassMethodDescription instproc getCategory {} {
    [my getIntroProxy] getCategoryForMethodBForObject [my getObjectName] [my getName]
}
