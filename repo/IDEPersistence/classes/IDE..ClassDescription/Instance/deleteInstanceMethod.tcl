IDE::ClassDescription instproc deleteInstanceMethod method {
    set im [my getInstanceMethodObjName $method]
    $im makeTransistent
    $im destroy
}
