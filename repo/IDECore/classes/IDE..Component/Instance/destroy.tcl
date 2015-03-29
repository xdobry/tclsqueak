IDE::Component instproc destroy {} {
    IDE::Component unset components([my name])
    next
}
