IDE::TParser instproc testBDListPrs {} {
    set sample {{1 "e g" {1 2} { }}}
    set stream [ReadStringStream new -childof [self] -string $sample]
    set prs [TclParser new -childof [self] -stream $stream]
    set rootCommand [[$prs getCommand $prs] getElem 0]
    $rootCommand extractList
    set list [$rootCommand getAsList]
    my assert {[llength $list]==4}
    set lastElem [lindex $list 3]
    $lastElem extractList
    set lsub [$lastElem getAsList]
    $prs destroy
    $stream destroy

}
