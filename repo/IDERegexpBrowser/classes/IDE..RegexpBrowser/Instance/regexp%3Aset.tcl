IDE::RegexpBrowser instproc regexp:set text {
    my instvar data

    $data(w:regexp) delete 1.0 end
    $data(w:regexp) insert 1.0 $text
}
