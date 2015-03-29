IDE::ObjectDescription proc getLoadedVersionForName name {
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $name]
    if {$introProxy ne "" && [set desc [$introProxy getDescriptionForObject $name]] ne ""} {
        return [$desc set objectid]
    }
    return
}
