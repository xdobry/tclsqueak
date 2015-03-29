IDE::ListViewEvent instproc invokeActionCommand action {
    [my actionHandler] invokeAction $action [self] [my set sobject]
}
