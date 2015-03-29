PrsContext instproc addVariableFromList {prsObject notifier} {
    $prsObject extractList
    foreach variable [$prsObject getAsList] {
        my addVariableFrom $variable $notifier
    }
}
