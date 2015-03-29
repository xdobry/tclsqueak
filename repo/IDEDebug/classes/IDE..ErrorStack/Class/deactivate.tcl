IDE::ErrorStack proc deactivate {} {
    namespace eval :: {
        rename bgerror_old bgerror
    }
}
