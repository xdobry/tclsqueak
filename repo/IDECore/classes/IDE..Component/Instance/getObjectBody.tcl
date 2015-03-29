IDE::Component instproc getObjectBody {object {nometa 0}} {
    set introProxy [my getIntroProxy]
    $introProxy getObjectBody $object $nometa
}
