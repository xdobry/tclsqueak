IDE::TSourceManaging instproc testCSaveInFile {} {
    my instvar cobj
    $cobj saveAsScript [my getFileName]
    my hardAssert {[file exists [my getFileName]]}
    #[self] halt
}
