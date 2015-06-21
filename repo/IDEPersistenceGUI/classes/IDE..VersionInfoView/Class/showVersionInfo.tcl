IDE::VersionInfoView proc showVersionInfo object {

    set message "Version Info\n[$object getName]\ntimestamp=[$object set timestamp]\nId=[$object getIdValue]"
    if {[$object exists basedon] && [$object set basedon] ne "" && [$object set basedon]!=0} {
        append message "\nbased on [$object set basedon]"
    }
    if {[$object exists userid] && [$object set userid] ne ""} {
        append message "\nuserid=[$object set userid]"
    }

    if {[$object exists isclosed] && [$object set isclosed]==1} {
        append message "\n labeled/closed"
    }
    if {[$object exists versioninfo]} {
        set versioninfo [$object set versioninfo]
    } else {
        set versioninfo {}
    }
    set ret [IDE::IDialogEntry getValue $message $versioninfo]
    if {$ret ne "" && $ret!=$versioninfo} {
        $object setVersionInfo $ret
    }
}
