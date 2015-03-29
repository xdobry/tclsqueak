IDE::SystemConfigMap proc getValueForType type {
    if {[my exists $type]} {
        return [my set $type]
    }
}
