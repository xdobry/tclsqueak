TestArgumentChecker instproc parseError {elem message} {
    my instvar parseErrorElem parseErrorMessage
    set parseErrorElem $elem
    set parseErrorMessage $message
    error "$message"
}
