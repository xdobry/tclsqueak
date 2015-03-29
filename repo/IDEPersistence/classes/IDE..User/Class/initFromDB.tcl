IDE::User proc initFromDB {columns values objectid} {
    return [my create [self]::default]
}
