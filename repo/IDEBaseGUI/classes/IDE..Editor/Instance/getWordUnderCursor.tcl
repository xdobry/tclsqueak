IDE::Editor instproc getWordUnderCursor {} {
    set twin [my getTextWindow]
    return [$twin get {insert wordstart} {insert wordend}]
}
