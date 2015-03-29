IDE::ObjectEdition instproc setInstanceMethodsArray arr_ref {
    my instvar cashInstance
    my initMethodsArrays
    upvar $arr_ref arr
    array set arr $cashInstance
}
