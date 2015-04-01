PgSql instproc password args {
  if {[llength $args] == 0} {
    return [::set [self]::[self proc]]
  } elseif {[llength $args] == 1} {
    return [::set [self]::[self proc] [lindex $args 0]]
  } else {
    error "wrong # args: [self] [self proc] ?value?"
  }
}
