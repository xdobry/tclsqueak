IDE::FileBrowser proc newBrowser {} {
    # File Browser is a singleton. becauso can not ease share mount point and copy puffer
    if {![Object isobject filebrowser]} {
        my create filebrowser .filebrowser
    }
}
