MySql instproc extract_table {visitor table} {
    array set typeconv [my getTypeConvert]
    
    set qhandle [my query "describe $table"]
    while {[set attr [$qhandle fetch]] ne ""} {
	set alist {}
	keylset alist name [lindex $attr 0]
	# Der Typ wird in der Form angegeben typ(length) z.B varchar(20)
	# Hier wird er in zwei Attribute gespalten
	if {[regexp {([a-z]+)\((.+)\)} [lindex $attr 1] _ typ length]} {
	    set type $typ
	    if {$typ eq "enum" || $typ eq "set"} {
		set vl {}
		foreach it [split $length ,] {
		    lappend vl [string trim $it '\"]
		}
		keylset alist valuelist $vl
	    } else {
		keylset alist length $length
	    }
	} else {
	    set type [lindex $attr 1]
	}
       if {[info exists typeconv($type)]} {
             set type $typeconv($type)
        }
        keylset alist type $type
	if {[lindex $attr 2] eq "YES"} {
	    keylset alist null 1
	}
	if {[lindex $attr 3] eq "PRI"} {
	    keylset alist primary_key 1
	}
	if {[lindex $attr 4] ne ""} {
	    keylset alist default [lindex $attr 4]
	}
	if {[lindex $attr 5] eq "auto_increment"} {
	    keylset alist auto_increment 1
	}
	$visitor newattribute $alist
    }
    $qhandle destroy
}
