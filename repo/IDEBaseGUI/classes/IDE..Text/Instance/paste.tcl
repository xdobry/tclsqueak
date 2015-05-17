IDE::Text instproc paste {} {
   event generate [my getTextWindow] <<Paste>>
}
