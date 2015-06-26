TclHtmlBuilder instproc printHtmlHeader {title {headeradds {}}} {
    my instvar out

    puts $out "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">
<html>
<head>
  <meta name=\"Language\" content=\"en\">
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
  <meta name=\"generator\" content=\"ttclcheck\">
  <meta name=\"date\" content=\"[clock format [clock seconds] -format {%Y-%m-%dT%H:%M:%S}]\">
  <title>$title</title>
  <link rel=\"stylesheet\" type=\"text/css\" href=\"[my getRootReference tcl2html.css]\">
  $headeradds
</head>
<body>
"

}
