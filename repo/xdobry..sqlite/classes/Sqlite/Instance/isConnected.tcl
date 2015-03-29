Sqlite instproc isConnected {} {
    expr { [my exists connected] && [my set connected]}
}
