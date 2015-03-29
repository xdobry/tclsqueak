IDE::NSElements instproc changeViewType type {
    my set vtype $type
    if {[my exists vnamespace]} {
        my selectFor [my set vnamespace]
    }
}
