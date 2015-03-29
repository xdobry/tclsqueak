IDE::MethodView instproc getComponentInContext {} {
    if {[Object isobject [my info parent]::appview]} {
        return [[my info parent]::appview selectedItem]
    } else {
        set introProxy [my getIntroProxy]
        return [$introProxy getComponentNameForObject [my set vclass]]
    }
}
