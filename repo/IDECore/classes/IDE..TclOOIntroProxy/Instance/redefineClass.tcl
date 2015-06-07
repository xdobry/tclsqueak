IDE::TclOOIntroProxy instproc redefineClass {className superclass variables} {
    set haschange 0
    if {$variables ne [info class variables $className]} {
        oo::define $className variable -set {*}$variables
        set haschange 1
    }
    if {$superclass ne [IDE::XOIntroProxy [info class superclasses $className]] &&
        !($superclass eq "" && [info class superclasses $className] eq "::oo::object")} {
        if {$superclass eq ""} {set superclass ::oo::object}
        oo::define $className superclass -set {*}$superclass
        set haschange 1
    }
    if {$haschange} {
        set desc [my getDescriptionForObject $className]
        if {$desc ne ""} {
            $desc updateDefbody
        }
    }
}
