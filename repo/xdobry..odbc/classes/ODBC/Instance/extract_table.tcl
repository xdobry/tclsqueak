ODBC instproc extract_table {visitor table} {
    my instvar handle
    # 0 TABLE_QUALIFIER
    # 1 TABLE_OWNER
    # 2 TABLE_NAME
    # 3 COLUMN_NAME
    # 4 DATA_TYPE
    # 5 TYPE_NAME
    # 6 PRECISION
    # 7 LENGTH
    # 8 SCALE
    # 9 RADIX
    # 10 NULLABLE
    # 11 REMARKS
    
    # this array specify the conversion of types
    array set typeconv [my getTypeConvert]
    
    # Unbekannt bleiben default value und primary key
    foreach attr [$handle columns $table] {
        set alist {}
        keylset alist name [encoding convertfrom [lindex $attr 3]]
        set type [string tolower [lindex $attr 5]]
        # MSSQL produce something like that "numeric() identity"
	if {[string match *identity $type]} {
	     keylset alist primary_key 1
             keylset alist auto_increment 1
             regexp {^\w+} $type type
        }
        if {$type eq "counter" || $type eq "autovalue"} {
            set type int
            keylset alist auto_increment 1
            keylset alist primary_key 1
        }
	if {[info exists typeconv($type)]} {
             set type $typeconv($type)
        }
        keylset alist type $type
        keylset alist null [lindex $attr 10]
        if {$type eq "decimal"} {
            # PRECISION
            keylset alist length [lindex $attr 6]
            # SCALE
            keylset alist precision [lindex $attr 8]
        } else {
            keylset alist precision [lindex $attr 6]
            if {$type eq "varchar"} {
                keylset alist length [lindex $attr 6]
            } else {
                keylset alist length [lindex $attr 7]
            }
        }
        $visitor newattribute $alist
    }
}
