PgSql instproc convertBytea value {
    # we assume that postgres octed notation is equal to Tcl
    subst -nocommands -novariables $value
}
