IDE::ClassMethodDescription instproc undefine {} {
    [my getIntroProxy] deleteMethodForObject [my getObjectName] [my getName] Class 0
}
