IDE::FindReplaceDestroyHelper instproc destroy {} {
    IDE::FindReplace destroySignalFromView [my info parent]
}
