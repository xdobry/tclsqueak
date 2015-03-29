IDE::RepositoryImporter instproc isConnectedRepository {} {
    my instvar exportRepository
    expr {[info exists exportRepository] && $exportRepository ne "" && [$exportRepository isConnected]}
}
