IDE::ObjectCache proc destroyInstancesOfClass class {
    regsub -all :: $class {} name
    set arrname cache_$name
    my instvar $arrname
    if {![array exists $arrname]} return
    set objs {}
    set indicator [array startsearch $arrname]
    while {[array anymore $arrname $indicator]} {
        set elem [array nextelement $arrname $indicator]
        lappend objs [set ${arrname}($elem)]
    }
    array donesearch $arrname $indicator
    foreach obj $objs {
        $obj destroy
    }
    catch {my unset $arrname}
}
