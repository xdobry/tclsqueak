IDE::NSElements instproc inspectArray {} {
    my instvar velem
    IDE::ArrayBrowser inspectGlobalArray $velem [my getIntroProxy]
}
