ODBC instproc queryList statement {
    if {[catch {[[self] set handle] $statement} err]} {
        my errorMessage $err
        return
    }
    return $err
}
