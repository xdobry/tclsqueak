IDE::TclOOIntroProxy instproc getBodyClassMethod {obj p} {
    return "oo::objdefine $obj method $p [info object definition $obj $p]\n"
}
