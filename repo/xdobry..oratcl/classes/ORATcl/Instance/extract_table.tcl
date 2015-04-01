ORATcl instproc extract_table {visitor table} {
    my instvar handle
    # {name size type precision scale nullok}
    #  0    1    2    3         4     5
    
    # this array specify the conversion of types
    array set typeconv [my getTypeConvert]
    
    # Unbekannt bleiben default value und primary key
    foreach attr [oradesc $handle $table] {
        set alist {}
        keylset alist name [lindex $attr 0]
        set type [string tolower [lindex $attr 2]]
	if {[info exists typeconv($type)]} {
             set type $typeconv($type)
        }
        keylset alist type $type
        keylset alist null [lindex $attr 5]
        if {$type eq "decimal"} {
            # PRECISION
            keylset alist length [lindex $attr 1]
            # SCALE
            keylset alist precision [lindex $attr 3]
        } else {
            keylset alist precision [lindex $attr 3]
            if {$type eq "varchar"} {
                keylset alist length [lindex $attr 1]
            } else {
                keylset alist length [lindex $attr 1]
            }
        }
        $visitor newattribute $alist
    }
}
