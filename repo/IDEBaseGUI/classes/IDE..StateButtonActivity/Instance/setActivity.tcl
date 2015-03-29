IDE::StateButtonActivity instproc setActivity bool {
    my instvar state win unactiveColor
    if {$bool} {
        $win configure -bg blue
    } else {
        $win configure -bg $unactiveColor
    }
}
