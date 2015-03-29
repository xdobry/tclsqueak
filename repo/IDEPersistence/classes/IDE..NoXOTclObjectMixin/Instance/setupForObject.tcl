IDE::NoXOTclObjectMixin instproc setupForObject {pobject pintroProxy} {
    my instvar object cobj introProxy tracking
    set object $pobject
    set introProxy $pintroProxy
    set tracking 0
    IDE::ObjectDescriptionsRepo setDescForObject $object [self]		
}
