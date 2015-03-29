IDE::User proc initDefault {} {
    set systemName [my getSystemUser]
    set instance [[self]::descriptor createInstancesFromWhere [self] name $systemName]
    if {$instance eq ""} {
        my createDefault
    }
}
