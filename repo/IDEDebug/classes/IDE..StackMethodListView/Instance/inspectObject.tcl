IDE::StackMethodListView instproc inspectObject {} {
    [my info parent] inspectObjectFromStack [my selectedIndex]
}
