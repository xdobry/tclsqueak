IDE::Component proc getCompObjectForNameIfExist component {
    if {[my exists components($component)]} {
        return [my set components($component)]
    }
    return {}
}
