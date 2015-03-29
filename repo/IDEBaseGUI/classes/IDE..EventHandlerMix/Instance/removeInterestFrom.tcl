IDE::EventHandlerMix instproc removeInterestFrom obj {
    if {[my array exists _events]} {
        my instvar _events
        set indicator [array startsearch _events]
        while {[array anymore _events $indicator]} {
            set elem [array nextelement _events $indicator]
            set _events($elem) [ide::lselect each $_events($elem) {[lindex $each 0]!=$obj}]
        }
        array donesearch _events $indicator
    }
}
