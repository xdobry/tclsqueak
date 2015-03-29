IDE::Editor instproc evalSubstituteSelection {} {
    my instvar win
    set sel [my getSelection]
    if {$sel ne ""} {
        my appendToCursorAndSelect [my substituteString $sel]
    }
}
