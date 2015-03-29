IDE::DocGeneratorComponent instproc contentObject object {
    set ind 0
    set text "<a name=\"object_$object\">\n<h3>Object $object</h3>\n"
    append text [my getCommentClass [$object getComment] objcomment]
    append text [my contentObjectProcs $object]
    return $text
}
