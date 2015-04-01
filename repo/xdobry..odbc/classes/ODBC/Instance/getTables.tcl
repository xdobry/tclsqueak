ODBC instproc getTables {} {
    my instvar handle
    set ret {}
    foreach tinfo [$handle tables] {
         set type [lindex $tinfo 3]
	   if {$type eq "SYSTEM TABLE" || $type eq "VIEW"} continue
	   lappend ret [encoding convertfrom [lindex $tinfo 2]]
    }
    return $ret
}
