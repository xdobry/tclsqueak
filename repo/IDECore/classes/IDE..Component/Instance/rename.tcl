IDE::Component instproc rename newname {
    IDE::Component unset components([my name])
    foreach obj [concat [my getClasses] [my getObjects]] {
        $obj setMetadata component $newname
    }
    my name $newname
    IDE::Component set components([my name]) [self]
}
