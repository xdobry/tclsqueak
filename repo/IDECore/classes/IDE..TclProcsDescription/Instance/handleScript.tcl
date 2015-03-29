IDE::TclProcsDescription instproc handleScript script {
    # Warning! no check for syntax at this level
    # see handleScript in IDE::ProcsGroup
    # TODO namespace handling
    namespace eval :: $script
}
