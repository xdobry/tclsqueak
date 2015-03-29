IDE::CompViewDB instproc loadFromDB {} {
    IDE::VersionBrowser [Object autoname vbrowser] [Object autoname .vbrowser] -vobject IDE::ComponentPersistence -type available
}
