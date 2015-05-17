IDE::MethodEditNotebook instproc askForModification args {
    #[my getCurrentMethodEdit] askForModification {*}$args
    return 1
}
