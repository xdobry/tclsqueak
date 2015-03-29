IDE::NSElements instproc selectItem item {
    my instvar velem vtype vnamespace
    set velem $item
    if {$item eq ""} {
        [my info parent]::@edit makeEmpty
        return
    }
    set introproxy [my getIntroProxy]
    switch -- $vtype {
        Procs {
           set c [$introproxy getProcBody $velem]
        }
        Vars {
           set c [my getVariableContent $velem]
        }
        Imports {
           set c [$introproxy inspectEvalNs $vnamespace [list namespace origin $velem]]
        }
        Exports {
           set c [$introproxy getProcBody $velem]
        }
        default {
            set c unsupported
        }
    }
    [my info parent]::@edit set vnamespace $vnamespace
    [my info parent]::@edit setTextControler $c [self]
}
