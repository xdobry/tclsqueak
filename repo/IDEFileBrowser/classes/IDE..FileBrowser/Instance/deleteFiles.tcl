IDE::FileBrowser instproc deleteFiles files {
    my instvar action pfiles currentDic
    if {[IDE::Dialog yesNo "Really delete [llength $files] files?"]} {
        foreach f $files {
            file delete -force [file join $currentDic $f]
        }
    }
    my refreshFiles
}
