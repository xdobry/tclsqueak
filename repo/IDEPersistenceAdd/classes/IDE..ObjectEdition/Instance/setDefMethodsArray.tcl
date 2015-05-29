IDE::ObjectEdition instproc setDefMethodsArray arr_ref {
    my instvar cashDef
    my initMethodsArrays
    upvar $arr_ref arr
    array set arr $cashDef
}
