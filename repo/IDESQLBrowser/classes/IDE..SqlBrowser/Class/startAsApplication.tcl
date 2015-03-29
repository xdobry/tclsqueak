IDE::SqlBrowser proc startAsApplication {} {
     my initTkTable
     frame .f
     pack .f -fill both -expand yes
     my create sqlbrowser .f -isApplication 1
     wm deiconify .
}
