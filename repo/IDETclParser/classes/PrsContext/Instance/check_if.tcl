PrsContext instproc check_if {count command notifier} {
    my evalExpr [$command getElem 1] $notifier
    # !!! no exactly syntax check
    set wasElseIf 0
    for {set x 2} {$x<=$count} {incr x} {
        set elem [$command getElem $x]
        if {[$elem info class] eq "::PrsLiteral"} {
            set name [$elem prsString]
            if {[lsearch -exact {then else elseif} $name]!=-1} {
                if {[$notifier hasclass ::PrsSyntaxHightlight]} {
                    $notifier hightlightElement $elem tclproc
                }
                if {$name eq "elseif"} {
                    set wasElseIf 1
                } else {
                    set wasElseIf 0
                }
                continue
            }
        }
        if {$wasElseIf} {
            my evalExpr $elem $notifier
        } else {
            my evalContents $elem
            if {[$elem hasclass PrsNoSubst]} {
                $command setType [$elem getEvalType]
            }
        }
        set wasElseIf 0
    }
}
