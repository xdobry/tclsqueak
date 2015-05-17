proc ide::initOwnBGError {} {
    variable origHandler
    set origHandler [interp bgerror {}]
    interp bgerror {} ::ide::mbgerror
}
