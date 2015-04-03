IDE::ClassViewDB instproc loadClassDefEdition desc {
    my instvar cobj
    IDE::VersionBrowser [Object autoname vbrowser] [Object autoname .vbrowser] -vobject $desc -type version -name __defbody -componentObject $cobj
}
