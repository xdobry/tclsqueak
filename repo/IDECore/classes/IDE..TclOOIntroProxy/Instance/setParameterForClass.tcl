IDE::TclOOIntroProxy instproc setParameterForClass {class variables} {
    oo::define $class variable -set {*}$variables
}
