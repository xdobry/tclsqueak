PrsMarkupVisitor instproc generateErrors errOut {
    my instvar errors

    $errOut puts {<table class="errors">}
    $errOut puts {<tr><th>No</th><th>File</th><th>Message</th></tr>}

    set errNo 1
    foreach error $errors {
        lassign $error file message
        $errOut puts "<tr><td>$errNo</td><td><a href=\"[my fileToHtmlFile $file]#e$errNo\" target=\"sourceFrame\">$file</a></td><td>$message</td></tr>"
        incr errNo
    }
    $errOut puts "</table>"

}
