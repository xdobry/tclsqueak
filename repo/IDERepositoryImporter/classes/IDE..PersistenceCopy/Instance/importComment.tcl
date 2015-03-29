IDE::PersistenceCopy instproc importComment {} {
    my instvar infoid exportRepository
    set comment [lindex [lindex [[my getConnection] queryList "select text from Info where infoid=$infoid"] 0] 0]
    set infoid [[my getTargetConnection] insertRowAutoId Info text [list $comment] infoid]
}
