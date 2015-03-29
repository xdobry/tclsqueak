IDE::NSElements instproc selectFor namespace {
    my instvar vnamespace vtype
    set vnamespace $namespace
    if {$namespace eq ""} {
        my resetList
        return
    }
    my selectItem {}
    set inpectObject [my getIntroProxy]
    $inpectObject setCurrentNS $vnamespace
    switch $vtype {
        Procs {
            set l [$inpectObject inspectEvalNs $vnamespace {info procs}]
        }
        Vars {
            set l [$inpectObject getNSVars]
        }
        Classes {
            set xns ::xotcl::classes${vnamespace}
            if {[$inpectObject inspectEval [list namespace exists $xns]]} {
                set l [$inpectObject inspectEval [list namespace children ::xotcl::classes${vnamespace}]]
            } else {
                set l [list]
            }
        }
        Imports {
            set l [$inpectObject inspectEvalNs $vnamespace [list namespace import]]
        }
        Exports {
            set l [$inpectObject inspectEvalNs $vnamespace [list namespace export]]
        }
        default {
            set l [list]
        }
    }
    my setList $l
}
