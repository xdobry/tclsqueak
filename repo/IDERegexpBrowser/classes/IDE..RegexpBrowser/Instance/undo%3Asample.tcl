IDE::RegexpBrowser instproc undo:sample {} {
    my instvar data
    # display result
    $data(w:sample) delete 1.0 end
    $data(w:sample) insert 1.0 $data(v:undo:sample)
    # colorize
    my go
}
