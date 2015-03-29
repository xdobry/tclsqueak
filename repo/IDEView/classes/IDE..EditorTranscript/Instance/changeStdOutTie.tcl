IDE::EditorTranscript instproc changeStdOutTie {} {
    my instvar stdOutTie
    if {$stdOutTie} {
        trace add execution puts enter ide::putsTrace
    } else {
        trace remove execution puts enter ide::putsTrace
    }
}
