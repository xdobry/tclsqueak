Tcl2HTML instproc printHtmlHeader {outstream title {headeradds {}}} {

    puts $outstream "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">
<html>
<head>
  <meta name=\"Language\" content=\"en\">
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
  <title>$title</title>
  <link rel=\"stylesheet\" type=\"text/css\" href=\"tcl2html.css\">
  $headeradds
</head>
<body>
"

}
