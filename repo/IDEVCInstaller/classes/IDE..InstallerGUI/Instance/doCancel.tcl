IDE::InstallerGUI instproc doCancel {} {
    if {[IDE::Dialog yesNo "Do you want to cancel the installation. No rollback will be done!"] eq "yes"} {
        if {[Object isobject ::Transcript]} {
            my destroy
        } else {
            exit
        }
    }
}
