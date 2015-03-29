IDEPreferences proc getParameter key {
    if {[my exists preferences($key)]} {
        return [my set preferences($key)]
    } elseif {[my exists $key]} {
        return [my set $key]
    }
    return
}
