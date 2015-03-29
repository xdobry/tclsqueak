IDE::CompViewDB instproc computeRequired cobj {
    $cobj computeRequirements
    IDE::Dialog message "The requirements for \"[$cobj getName]\" was set to:\n[join [$cobj getRequiredFrom] \n]"
}
