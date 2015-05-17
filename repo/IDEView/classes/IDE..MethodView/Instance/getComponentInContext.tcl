IDE::MethodView instproc getComponentInContext {} {
    if {[Object isobject [my info parent]::@compview]} {
        return [[my info parent]::@compview selectedItem]
    } else {
        set introProxy [my getIntroProxy]
        return [$introProxy getComponentNameForObject [my set vclass]]
    }
}
