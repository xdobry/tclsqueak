IDE::Component instproc basicRemoveObject object {
    # private dont use it
    my instvar classes objects
    if {[Object isclass $object]} {
       ide::lremove classes [string trimleft $object :]
    } else {
       ide::lremove objects [string trimleft $object :]
    }
}
