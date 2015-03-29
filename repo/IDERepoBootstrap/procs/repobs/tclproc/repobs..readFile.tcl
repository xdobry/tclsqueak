proc repobs::readFile file {
    set in [open $file r]
    set source [read $in]
    close $in
    return $source
}
