IDE::ChangesBrowser instproc produceChangesScriptFor comps {
    foreach comp $comps {
        set cobj [IDE::Component getCompObjectForNameIfExist $comp]
        if {$cobj eq ""} continue
        if {![$cobj isPersistent]} continue
        if {[$cobj isclosed]} {
            append ret "#comp $comp is versioned\n"
            continue
        }
        if {[$cobj set basedon] eq "" || [$cobj set basedon]==0} {
            append ret "#comp $comp no previous version\n"
            continue
        }
        set comp2 [IDE::ComponentEdition new [$cobj set basedon]]
        append ret [my getChangesScript $cobj $comp2]
    }
    IDE::System handleResult $ret
}
