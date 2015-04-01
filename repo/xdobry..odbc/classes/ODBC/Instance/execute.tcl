ODBC instproc execute statement {
    if {[catch {[[self] set handle] $statement} err]} {
        my errorMessage $err
        return
    }
    return $err
}
