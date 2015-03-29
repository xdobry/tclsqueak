IDE::MetakitPersistenceManager instproc getAditionalInfoForMethodId methodid {
    set db [my getMetakitHandle]
    mk::get $db.Method!$methodid body
}
