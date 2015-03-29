IDE::ComponentPersistence proc getLoadedVersionForName name {
    set cobj [IDE::Component getCompObjectForNameIfExist $name]
    if {$cobj ne "" && [$cobj isPersistent]} {
        return [$cobj set componentid]
    }
    return
}
