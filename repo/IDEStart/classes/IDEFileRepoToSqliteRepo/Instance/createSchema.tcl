IDEFileRepoToSqliteRepo instproc createSchema {} {
    my instvar connection
    set statements [my getSchema]
    regsub -all {(\)\s*);} $statements \\1\0 statements
    regsub -all {(?i)(\s+end\s*);} $statements \\1\0 statements
    # mark if ;  is last element in the line
    regsub -all {(?n);$} $statements \0 statements
    foreach statement [split $statements \0] {
       if {[string trim $statement] eq ""} continue
       set ret [$connection execute $statement]
       if {$ret eq ""} break
    }
}
