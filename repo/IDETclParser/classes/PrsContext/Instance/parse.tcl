PrsContext instproc parse script {
    # !!! no base list consistency check
    my instvar errors parser rootCommand

    my initParser $script
    set braceshints [my checkBraces $script]
    if {[llength $braceshints]>0} {
        lappend errors $braceshints
        return 0
    }
    $parser skipComment
    set rootCommand [$parser getCommand $parser]

    set ret [my parseCommand]
    return $ret
}
