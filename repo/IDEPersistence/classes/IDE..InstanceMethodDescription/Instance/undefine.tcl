IDE::InstanceMethodDescription instproc undefine {} {
    [my getIntroProxy] deleteMethodForObject [my getObjectName] [my getName] Instance 0
}
