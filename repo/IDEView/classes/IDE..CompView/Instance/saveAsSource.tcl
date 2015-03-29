IDE::CompView instproc saveAsSource actual {
    set source [IDE::Dialog getSaveFile $actual.xotcl]
    if {$source ne ""} {
        [IDE::Component getCompObjectForName $actual] saveAsScript $source
    }
}
