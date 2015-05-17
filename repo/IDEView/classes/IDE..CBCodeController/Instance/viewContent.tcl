IDE::CBCodeController instproc viewContent {contentDescr requester} {
    if {$requester ne "navigation"} {
        my showNavigation $contentDescr
    }
    my setBodyText {*}$contentDescr
}
