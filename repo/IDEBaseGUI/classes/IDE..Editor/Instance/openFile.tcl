IDE::Editor instproc openFile file {
    my instvar win fileName
    if {$file eq ""} return
    set fileName $file
    set fh [open $fileName r]
    my set state notempty
    my setText [read $fh]
    close $fh
}
