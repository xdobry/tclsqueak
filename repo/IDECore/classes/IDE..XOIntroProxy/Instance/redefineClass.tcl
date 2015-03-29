IDE::XOIntroProxy instproc redefineClass {className superclass parameter} {
    if {$parameter ne [$className info parameter]} {
        $className parameter $parameter
    }
    if {$superclass ne [$className info superclass] &&
        !($superclass eq "" && [$className info superclass] eq "::xotcl::Object")} {
        if {$superclass eq ""} {set superclass ::xotcl::Object}
        $className superclass $superclass
    }
}
