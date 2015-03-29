IDEPreferences proc isFirstStart {} {
    expr {[my exists firstStart] && [my set firstStart]}
}
