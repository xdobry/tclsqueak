IDE::Debugger instproc showLocalVar var {
    my instvar realLevel
    if {[uplevel #$realLevel "array exists ${var}"]} {
        set value [uplevel #$realLevel "::array get ${var}"]
    } else {
        set value [uplevel #$realLevel "::set ${var}"]
    }
    my setVarValue $value [self]
}
