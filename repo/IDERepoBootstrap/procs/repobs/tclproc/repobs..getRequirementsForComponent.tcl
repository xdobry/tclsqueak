proc repobs::getRequirementsForComponent {compName dir} {
    set compDir [file join $dir [asFileName $compName]]
    set reqlist [file join $compDir require.list]
    if {[file exists $reqlist]} {
        return [readFileAsList $reqlist]
    }
    return
}
