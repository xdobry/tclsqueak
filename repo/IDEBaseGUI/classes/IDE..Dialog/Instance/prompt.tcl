IDE::Dialog instproc prompt {} {
    my instvar userAction
    set userAction cancel
    my suspendUntilSignal
    return $userAction
}
