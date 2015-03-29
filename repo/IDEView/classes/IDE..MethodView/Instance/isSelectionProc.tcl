IDE::MethodView instproc isSelectionProc {} {
    expr {[my set vtype] eq "Class" || [my set vtype] eq "Procs"}
}
