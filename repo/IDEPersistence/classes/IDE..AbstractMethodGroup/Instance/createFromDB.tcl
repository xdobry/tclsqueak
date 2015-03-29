IDE::AbstractMethodGroup instproc createFromDB methodId {
    set instance [IDE::MethodDescription::descriptor createInstanceFromDB [self] $methodId]
    return $instance
}
