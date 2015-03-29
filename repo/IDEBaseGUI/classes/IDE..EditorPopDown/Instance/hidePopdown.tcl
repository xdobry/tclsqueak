IDE::EditorPopDown instproc hidePopdown {} {
   wm withdraw [my set dropWin]
   focus [my getTextWindow]
}
