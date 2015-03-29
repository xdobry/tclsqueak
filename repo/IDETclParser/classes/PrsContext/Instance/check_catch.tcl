PrsContext instproc check_catch {count command notifier} {
    my evalContents [$command getElem 1]
    if {$count>=2} {
        my addVariableFrom [$command getElem 2] $notifier [my getTypeFromElem [$command getElem 1]] [my getDefaultScope] 1
    }
    if {$count>=3} {
        my addVariableFrom [$command getElem 3] $notifier [list dict] 1
    }

}
