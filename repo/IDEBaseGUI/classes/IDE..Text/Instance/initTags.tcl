IDE::Text instproc initTags {} {
    set twin [my getTextWindow]
    $twin tag configure hlight -background yellow
    $twin tag raise sel hlight
    next
}
