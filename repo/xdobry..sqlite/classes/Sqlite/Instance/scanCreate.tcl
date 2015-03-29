Sqlite instproc scanCreate isql {
    # return named list in keyedlist syntax für jede spalte
    set index 0
    set count 0
    set columns [list]
    set reswords [list CONSTRAINT PRIMARY UNIQUE ON NOT INDEX]
    set names [list]
    array set typeconv [my getTypeConvert]

    foreach column [my buildTokenList $isql] {
        set columnDef [list]
        set name [lindex $column 0]
        # skip constrains definitions
        if {[lsearch -exact $reswords [string toupper $name]]>=0} {
            if {[lindex $column 0] eq "PRIMARY" && [lindex $column 1] eq "KEY"} {
                regexp -- {\((.+)\)} [lindex $column 2] _ ldef
                set ldef [split $ldef ,]
                foreach pk $ldef {
                    if {[info exists columnsArr($pk)]} {
                        lappend columnsArr($pk) [list primary_key 1]
                    }
                }
            }
            continue
        }
        set type [string tolower [lindex $column 1]]
        if {[info exists typeconv($type)]} {
             set type $typeconv($type)
        }
        lappend columnDef [list name $name]
        lappend columnDef [list type $type]
        if {[string index [lindex $column 2] 0] eq "("} {
            regexp -- {\((.+)\)} [lindex $column 2] _ ldef
            set ldef [split $ldef ,]
            lappend columnDef [list length [lindex $ldef 0]]
            if {[llength $ldef]>1} {
                lappend columnDef [list precision [lindex $ldef 1]]
            }
        }
        if {[set defIndex [lsearch -regexp $column (?i)DEFAULT]]>1} {
            set default [lindex $column [expr {$defIndex+1}]]
            regexp -- {"(.+)"} $default _ default
            lappend columnDef [list default $default]
        }
        set notnull 0
        if {[set pIndex [lsearch -regexp $column (?i)PRIMARY]]>1} {
            if {[string equal -nocase [lindex $column [expr {$pIndex+1}]] KEY]} {
                lappend columnDef [list primary_key 1]
                set notnull 1
                if {[string equal -nocase $type integer]} {
                     lappend columnDef [list auto_increment 1]
                }
            }
        }
        if {[set pIndex [lsearch -regexp $column (?i)NOT]]>1} {
            if {[string equal -nocase [lindex $column [expr {$pIndex+1}]] NULL]} {
                set notnull 1
            }
        }
        if {!$notnull} {
            lappend columnDef [list null 1]
        }
        set columnsArr($name) $columnDef
        lappend names $name
    }
    foreach n $names {
        lappend columns $columnsArr($n)
    }
    return $columns
}
