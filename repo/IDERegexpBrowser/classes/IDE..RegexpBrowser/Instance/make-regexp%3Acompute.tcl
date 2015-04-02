IDE::RegexpBrowser instproc make-regexp:compute {} {
    my instvar data

    set words [$data(w:make:list) get 1.0 end-1c]
    $data(w:make:output) delete 1.0 end
    $data(w:make:output) insert 1.0 [make-regexp::make-regexp $words]
}
