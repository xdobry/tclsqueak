IDE::Debugger instproc inspectLevelVar var {
    my instvar level
    if {[uplevel #$level "array exists ${var}"]} {
        set value [uplevel #$level "::array get ${var}"]
    } else {
        set value [uplevel #$level "::set ${var}"]
    }
    [self]::methodedit setTextControler $value [self]
}
