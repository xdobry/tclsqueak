PrsContext instproc initBase {} {
    my instvar namespace stream parser isTclGlobalScript isTclproc parseMode
    set namespace ""
    set isTclGlobalScript 0
    set stream [ReadStringStream new -childof [self] -string {}]
    set parser [TclParser new -childof [self] -stream $stream]
    set isTclproc 0
    set parseMode collect
}
