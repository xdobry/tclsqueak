Sqlinterface instproc needEscape type {
    expr {[lsearch {decimal int boolean smallint money} $type]<0}
}
