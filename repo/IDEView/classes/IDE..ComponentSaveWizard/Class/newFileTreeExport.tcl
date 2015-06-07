IDE::ComponentSaveWizard proc newFileTreeExport {} {
    set exporter [my new [Object autoname .cswbrowser] -type fileTree]
    if {[info exists ::repobs::repodir]} {
        $exporter set targetDir $::repoobs::repodir
    }
    return $exporter
}
