IDE::RegexpBrowser instproc undo:regexp:compute {w k a} {
    my instvar data

    if {[string match -nocase "*control*" $k]
    || [string match -nocase "*shift*" $k]
    || [string match -nocase "*alt*" $k]} {
        return
    }

    set data(v:undo:r$data(v:undo:index)) [list [$w index insert] [$w get 1.0 end-1char]]
    set data(v:undo:index) [expr ($data(v:undo:index)+1) % 100]
}
