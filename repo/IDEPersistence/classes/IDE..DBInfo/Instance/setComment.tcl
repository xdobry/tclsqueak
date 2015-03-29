IDE::DBInfo instproc setComment text {
    if {![my istype IDE::DBInfo] && ![my istype IDE::CommentHandler]} {
        [my getDescription] setComment $text
    } else {
        my instvar comment infoid
        # !!! The sharing of info is not completly implemented
        set comment $text
        if {$text eq ""} {
            if {$infoid ne ""} {
                # my sqlexecute "DELETE FROM Info WHERE infoid=$infoid"
                # Metakit does not know NULL values for Integer
                if {[[[my getPersistenceManager] getConnection] istype XOMetakit]} {
                    set infoid 0
                } else {
                    set infoid NULL
                }
                my updateAttributes infoid
            }
        } else {
            if {[info exists infoid] && $infoid ne "" && $infoid ne "NULL" && $infoid!=0} {
                [my getPersistenceManager] updateAttributesBase Info infoid $infoid [list infotext $text]
            } else {
                my makeCommentPersistent
            }
        }
    }
}
