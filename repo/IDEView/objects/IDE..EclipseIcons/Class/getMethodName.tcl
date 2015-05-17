IDE::EclipseIcons proc getMethodName name {
    return "create[string toupper [string index $name 0]][string range $name 1 end]"
}
