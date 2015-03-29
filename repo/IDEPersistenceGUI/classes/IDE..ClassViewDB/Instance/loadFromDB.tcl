IDE::ClassViewDB instproc loadFromDB {} {
    my instvar cobj
    IDE::VersionBrowser  [Object autoname vbrowser] [Object autoname .vbrowser] -vobject IDE::ObjectDescription -type available -componentObject $cobj
}
