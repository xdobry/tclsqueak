IDE::TclKitDeployer instproc changeStarpack {} {
    my instvar starPackFile
    set starPackFile [IDE::Dialog getOpenFile {{{Exe Files} *.exe} {{All files} *}}]
}
