IDE::Text instproc dropAllColorized {} {
    set twin [my getTextWindow]
    $twin tag remove hlight 1.0 end
}
