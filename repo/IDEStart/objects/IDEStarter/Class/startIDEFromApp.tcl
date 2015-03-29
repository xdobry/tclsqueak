IDEStarter proc startIDEFromApp {} {
    my requireBaseComponents
    IDE initSystem
    IDE::Component initFromInterpreter
    IDE::CommentsContainer parseAndCleanMeta
    IDE::CommentsContainer makeTclGroupsFromMeta

    IDE::CompBrowser newBrowser
}
