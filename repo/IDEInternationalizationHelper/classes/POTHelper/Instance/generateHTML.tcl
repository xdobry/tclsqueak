POTHelper instproc generateHTML {} {
    my instvar catalog
    set rez "<html>\n<body>\n<ul>\n"

    foreach c $catalog {
        append rez " <li>$c</li>\n"
    }

    append rez "</ul>\n</body>\n</html>\n"

    IDE::ResultBrowser newBrowser $rez
}
