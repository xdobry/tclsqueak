IDE::TclProcsDescriptionPer instproc rereadForAnotherVersion methodId {
    my instvar methodid
    set methodid $methodId
    my rereadAttributes {basedon versioninfo timest category userid infoid}
    # the discriptor ignore body by reading from database
    # !! think to get data in one sql-statement
    set body [my getValueForColumns body]
    namespace eval :: [lindex $body 0]
}
