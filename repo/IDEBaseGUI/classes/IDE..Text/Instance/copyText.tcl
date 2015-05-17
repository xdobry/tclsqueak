IDE::Text instproc copyText {} {
   event generate [my getTextWindow] <<Copy>>
}
