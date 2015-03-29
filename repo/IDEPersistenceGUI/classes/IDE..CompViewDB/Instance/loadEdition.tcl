IDE::CompViewDB instproc loadEdition cobj {
    IDE::VersionBrowser [Object autoname vbrowser] [Object autoname .vbrowser] -vobject IDE::ComponentPersistence -type version -name [$cobj getName]
}
