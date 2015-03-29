SignatureRepository instproc resolveTypes {} {
    my resolveLinkedTypes
    my resolveLinkedTypesReduceSuperclass
    my resolveVariables
    my resolveSignatures
    my set linkTypes [list]
}
