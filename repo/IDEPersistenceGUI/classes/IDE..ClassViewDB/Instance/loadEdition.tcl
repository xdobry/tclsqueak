IDE::ClassViewDB instproc loadEdition desc {
    my instvar cobj
    IDE::VersionBrowser [Object autoname vbrowser] [Object autoname .vbrowser] -vobject IDE::ObjectDescription -type version -name [$desc getObjectName] -componentObject $cobj
}
