Sqlite instproc queryList sqlstatement {
    set result [list]
    if {[catch {
        [my set sqlhandle] eval $sqlstatement data {
            set row {}
            foreach column $data(*) {
                lappend row $data($column)
            }
            lappend result $row
        }
    } err]} {
        my errorMessage $err
        return
    }
    return $result
}
