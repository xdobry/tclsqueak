IDE::InstallerGUI instproc installTables {} {
    my instvar connection
    if {[$connection hasfunction getTables] && [ide::lcontain [$connection getTables] Component]} {
         IDE::Dialog message "The xotclide seems to be installed on the datebase. No action. If you want to reinstall them (system upgrade) then delete (drop) them first. Use update*.sql scripts for updating database schema"
         return 1
    }
    set schemafile [my getSchemaFile]
    set fh [open [file join [IDE::System getSystemDir] $schemafile] r]
    set statements [read $fh]
    if {[$connection istype XOMetakit]} {
        set dbhandle [$connection set handle]
        # metakit schema creation is simple Tcl script
        eval $statements
        return 1
    }
    # not all ; separate statements only ); and end;
    # see schema_sqlite.sql for example for it
    regsub -all {(\)\s*);} $statements \\1\0 statements
    regsub -all {(?i)(\s+end\s*);} $statements \\1\0 statements
    # mark if ;  is last element in the line
    regsub -all {(?n);$} $statements \0 statements

    foreach statement [split $statements \0] {
       if {[string trim $statement] eq ""} continue
       set ret [$connection execute $statement]
       if {$ret eq ""} break
    }
    close $fh
    if {$ret eq ""} {
        my installError "Error by installing schema on database.\n [$connection errorMessage]\n$statement"
    }
    return [expr {$ret ne ""}]
}
