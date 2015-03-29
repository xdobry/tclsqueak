PrsFileContext instproc openFile file {
    my instvar fileDesc fileName
    set fileName $file
    set fileDesc [open $file r]
}
