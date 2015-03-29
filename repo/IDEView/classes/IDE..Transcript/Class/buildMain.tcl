IDE::Transcript proc buildMain {} {
    if {[Object isobject ::transcript]} {
        return
    }
    frame .f
    pack .f -fill both -expand yes
    my create ::transcript .f
}
