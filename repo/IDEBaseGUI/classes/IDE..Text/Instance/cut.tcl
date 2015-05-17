IDE::Text instproc cut {} {
   event generate [my getTextWindow] <<Cut>>
}
