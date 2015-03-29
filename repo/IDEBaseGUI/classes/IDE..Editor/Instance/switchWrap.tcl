IDE::Editor instproc switchWrap {} {
    set twin [my getTextWindow]
    my instvar wrapMode
    if {$wrapMode} {
        set value "word"
    } else {
        set value "none"
    }
    $twin configure -wrap $value
    return $value
}
