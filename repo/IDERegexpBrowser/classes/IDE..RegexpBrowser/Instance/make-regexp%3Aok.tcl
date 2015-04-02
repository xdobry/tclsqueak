IDE::RegexpBrowser instproc make-regexp:ok w {
    my instvar data

    set words [$data(w:make:list) get 1.0 end-1c]

    $data(w:regexp) insert insert "([make-regexp::make-regexp $words])"
    destroy $w
}
