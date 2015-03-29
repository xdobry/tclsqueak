IDE::TParser instproc testBCBasePrs {} {
    set sample {{1 "e g" {1 2} 2}}
    set stream [ReadStringStream new -childof [self] -string $sample]
    set prs [TclParser new -childof [self] -stream $stream]
    set rootCommand [[$prs getCommand $prs] getElem 0]
    $rootCommand extractList
    set list [$rootCommand getAsList]
    my assert {[llength $list]==4}
    $prs destroy
    $stream destroy


    set sample {{1 a"e g" a{1 [} 2]}}
    set stream [ReadStringStream new -childof [self] -string $sample]
    set prs [TclParser new -childof [self] -stream $stream]
    set rootCommand [[$prs getCommand $prs] getElem 0]
    $rootCommand extractList
    set list [$rootCommand getAsList]
    my assert {[llength $list]==6}
    $prs destroy
    $stream destroy
}
