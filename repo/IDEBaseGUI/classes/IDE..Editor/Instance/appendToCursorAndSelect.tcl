IDE::Editor instproc appendToCursorAndSelect text {
    set sIndex [[my getTextWindow] index insert]
    my appendToCursor $text
    [my getTextWindow] tag remove sel 1.0 end
    [my getTextWindow] tag add sel $sIndex [[my getTextWindow] index insert]
}
