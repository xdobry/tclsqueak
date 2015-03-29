IDE::TParser instproc testCVarAsLiteral {} {
    set sample {
        proc1 $
        proc1 a$
        proc1 a$#
        proc1 [proc2 $]
        proc1 "a$#"
        proc1 "a#$"
    }
    set obj [ReadStringStream new -childof [self] -string $sample]
    set prs [TclParser new -childof [self] -stream $obj]
    $prs root [PrsNoSubst new -childof [$prs]]
    $prs parseScriptTo [$prs root]
    set script [$prs root]
    my assert {[$script hasclass PrsNoSubst]}
    my assert {[llength [$script list]]==6}

    set com [lindex [$script list] 0]
    my assert {[llength [$com list]]==2}
    my assert {[[lindex [$com list] 0] hasclass PrsLiteral]}
    my assert {[[lindex [$com list] 1] hasclass PrsLiteral]} "but is [[lindex [$com list] 1] info class]"

    set com [lindex [$script list] 1]
    my assert {[llength [$com list]]==2}
    my assert {[[lindex [$com list] 1] hasclass PrsLiteral]} "but is [[lindex [$com list] 1] info class]"

    set com [lindex [$script list] 2]
    my assert {[llength [$com list]]==2}
    my assert {[[lindex [$com list] 1] hasclass PrsLiteral]} "but is [[lindex [$com list] 1] info class]"


    $prs destroy
    $obj destroy
}
