PgSql instproc extract_table {visitor table} {
    #puts "extact Table";
    set qhandle [my query "select attname,typname,attnotnull,atttypmod,attlen from pg_class,pg_attribute,pg_type where pg_class.relname='$table' and pg_class.oid=pg_attribute.attrelid and pg_attribute.atttypid=pg_type.oid and attnum>0 order by attnum"]
    array set typeArr [my getTypeConvert]
    while {[set attr [$qhandle fetch]] ne ""} {
	#puts "extact Table --";
	set alist {}
	keylset alist name [lindex $attr 0]
	set type [lindex $attr 1]
	if {[info exists typeArr($type)]} {
	    set type $typeArr($type)
	}
	keylset alist type $type
	if {[lindex $attr 2] eq "f"} {
	    keylset alist null 1
	}
	if {[lindex $attr 4] eq "-1" && [lindex $attr 3] ne "-1" } {
	    keylset  alist tlenght [expr [lindex $attr 3]-4]
	}
	$visitor newattribute $alist
    }
    $qhandle destroy
}
