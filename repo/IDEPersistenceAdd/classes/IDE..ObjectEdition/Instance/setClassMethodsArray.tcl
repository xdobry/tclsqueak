IDE::ObjectEdition instproc setClassMethodsArray arr_ref {
    my instvar cashClass
    my initMethodsArrays
    upvar $arr_ref arr
    array set arr $cashClass
}
