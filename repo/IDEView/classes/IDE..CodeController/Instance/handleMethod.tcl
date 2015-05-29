IDE::CodeController instproc handleMethod {skript {contentDesc {}}} {
    my instvar actItem
    lassign $actItem class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    $introProxy handleScript $skript
    return $contentDesc
}
