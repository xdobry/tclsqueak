IDE::ProcsGroupPer instproc moveToComponent component {
    set ret [my makeTransistent]
    next
    if {[my returnAffectedRows] && $ret!=1} {
        IDE::Dialog message "DB Warning! Actual version control database is not consistent with client. The proc grpup version have been already not in component. Probably another user have removed the proc group version first. The operation have no effect in version control system!"
        return
    }
}
