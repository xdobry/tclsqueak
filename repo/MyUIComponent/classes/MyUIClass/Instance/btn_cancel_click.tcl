MyUIClass instproc btn_cancel_click {} {
    my instvar win textVariable
    # you may adapt the method directly in debugger
    # and try it again
    if {[namespace exists ::IDE::Debugger]} {
        ::xotcl::Object halt
    }
}
