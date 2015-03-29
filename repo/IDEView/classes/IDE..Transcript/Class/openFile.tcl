IDE::Transcript proc openFile file {
    set w [my newBrowser]
    $w @editor openFile $file
}
