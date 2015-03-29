PrsElement instproc prsStringToLineEnd {} {
    [[my getParser] stream] copyFromToLineEnd [my begin]
}
