IDE::ProgEdit instproc initTags {} {
    next
    set twin [my getTextWindow]
    $twin tag configure braceHL -borderwidth 1 -relief solid
    $twin tag configure silbingSelect -background SlateGray1
}
