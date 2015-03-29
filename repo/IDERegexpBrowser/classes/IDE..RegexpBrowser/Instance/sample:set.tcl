IDE::RegexpBrowser instproc sample:set text {
    my instvar data

    $data(w:sample) delete 1.0 end
    $data(w:sample) insert 1.0 $text
    set data(v:undo:sample) $text
}
