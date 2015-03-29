IDE::ClassMethodDescription instproc getBody {} {
    [my getIntroProxy] getBodyClassMethod [my getObjectName] [my getName]
}
