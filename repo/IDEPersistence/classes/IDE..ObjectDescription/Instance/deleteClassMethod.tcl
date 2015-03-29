IDE::ObjectDescription instproc deleteClassMethod method {
    set cm [my getClassMethodObjName $method]
    $cm makeTransistent
    $cm destroy
}
