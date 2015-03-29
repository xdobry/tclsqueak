IDE::TclOOIntroProxy instproc setSuperclassForClass {class superclasses} {
    oo::define $class superclass -set {*}$superclasses
}
