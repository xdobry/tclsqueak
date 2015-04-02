IDE::RegexpBrowser instproc regexp:insert what {
    my instvar data

    set w $data(w:regexp)
    # prepare undo/redo
    set data(v:undo:r$data(v:undo:index)) [list [$w index insert] [$w get 1.0 end-1char]]
    set data(v:undo:index) [expr ($data(v:undo:index)+1) % 100]
    # do it
    $w insert insert $what
    # prepare undo/redo
    set data(v:undo:r$data(v:undo:index)) [list [$w index insert] [$w get 1.0 end-1char]]
}
