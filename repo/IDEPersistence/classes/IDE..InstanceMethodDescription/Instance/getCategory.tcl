IDE::InstanceMethodDescription instproc getCategory {} {
    [my getIntroProxy] getCategoryForMethodBForObject [my getObjectName] [my getName] {}
}
