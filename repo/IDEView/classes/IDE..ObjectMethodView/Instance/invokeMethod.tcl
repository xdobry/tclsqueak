IDE::ObjectMethodView instproc invokeMethod actual {
    my instvar introProxy
    set obj [[my info parent] set vobject]
    set method [lindex $actual 0]
    IDE::System invokeProcWithArg $obj $method {*}[$introProxy getMethodParamDescForObject $obj $method]
}
