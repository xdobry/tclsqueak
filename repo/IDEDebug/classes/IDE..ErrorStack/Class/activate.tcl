IDE::ErrorStack proc activate {} {
    namespace eval :: {
        rename bgerror bgerror_old
        proc bgerror message {
            global errorInfo
            IDE::ErorStack newBrowser $errorInfo
        }
    }
}
