Sqlite instproc execute sqlstatement {
    if {[catch  {[my set sqlhandle] eval $sqlstatement} err]} {
        my errorMessage $err
        return
    }
    my returnAffectedRows
}
