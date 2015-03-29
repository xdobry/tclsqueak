PrsFileContext instproc parseFilesPass {files _scanMode} {
    my instvar parseMode allLinesCount lineCount
    set parseMode $_scanMode
    tlog::warn "pass $parseMode"
    foreach f $files {
        tlog::warn "parsing $f"
        my parseFile $f
        incr allLinesCount $lineCount
    }
}
