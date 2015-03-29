IDE::NSIntroProxy instproc evalString string {
    my instvar currentNS
    my inspectEvalNs $currentNS $string
}
