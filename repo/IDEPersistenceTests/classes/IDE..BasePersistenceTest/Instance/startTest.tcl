IDE::BasePersistenceTest instproc startTest {} {
    if {![Object isobject IDE::SimplePersistenceClass::descriptor]} {
        IDE::SimplePersistenceClass initDescriptor
    }
    IDE::SimplePersistenceClass::descriptor checkSchema
    return 1
}
