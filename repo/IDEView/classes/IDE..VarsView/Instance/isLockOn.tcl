IDE::VarsView instproc isLockOn {} {
    expr {[my hasLock] && [my set lock]}
}
