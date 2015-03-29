IDE::CompViewDB instproc versionEdition cobj {
    $cobj versionEdition
    IDE::System refreshComponentView [$cobj getName]
}
