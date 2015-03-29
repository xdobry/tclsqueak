IDE::TParser instproc testCSimple {} {
    set sample {
        proc1 arg1 arg2; proc2 arg2
        # hier is my comment
        proc3 "rrr rerwer" $variable
        proc4 {ewewewewe ewew weqweq}
    }
    set obj [ReadStringStream new -childof [self] -string $sample]
    set prs [TclParser new -childof [self] -stream $obj]
    $prs root [PrsNoSubst new -childof [$prs]]
    $prs parseScriptTo [$prs root]
    set script [$prs root]
    my assert {[$script info class] eq "::PrsNoSubst"}
    my assert {[llength [$script list]]==5}
    my assert {[[lindex [$script list] 0] info class] eq "::PrsCommand"}
    my assert {[[lindex [$script list] 2] info class] eq "::PrsComment"}

    set com [lindex [$script list] 0]
    my assert {[llength [$com list]]==3}
    my assert {[[lindex [$com list] 0] info class] eq "::PrsLiteral"}
    my assert {[[lindex [$com list] 0] begin]==9}
    my assert {[[lindex [$com list] 0] end]==13}
    my assert {[[lindex [$com list] 0] prsString] eq "proc1"}

    set com [lindex [$script list] 3]
    my assert {[llength [$com list]]==3}
    my assert {[[lindex [$com list] 1] info class] eq "::PrsQuoted"}
    my assert {[[lindex [$com list] 1] begin]==80}
    my assert {[[lindex [$com list] 1] end]==91}
    my assert {[[lindex [$com list] 1] prsString] eq "\"rrr rerwer\""}
    my assert {[[lindex [$com list] 2] info class] eq "::PrsVariable"}
    my assert {[[lindex [$com list] 2] begin]==93}
    my assert {[[lindex [$com list] 2] end]==101}
    my assert {[[lindex [$com list] 2] prsString] eq "\$variable"}

    set com [lindex [$script list] 4]
    my assert {[llength [$com list]]==2}
    my assert {[[lindex [$com list] 1] info class] eq "::PrsNoSubst"}
    my assert {[[lindex [$com list] 1] begin]==117}
    my assert {[[lindex [$com list] 1] end]==139}
    my assert {[[lindex [$com list] 1] prsString] eq "{ewewewewe ewew weqweq}"}

    $prs destroy
    $obj destroy
}
