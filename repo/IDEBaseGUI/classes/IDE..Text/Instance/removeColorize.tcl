IDE::Text instproc removeColorize {} {
    set twin [my getTextWindow]
    $twin tag remove hlight 0.0 end
}
