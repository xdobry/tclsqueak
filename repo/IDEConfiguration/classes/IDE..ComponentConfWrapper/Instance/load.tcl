IDE::ComponentConfWrapper instproc load {} {
    set cobj [IDE::Component getCompObjectForNameIfExist [my name]]
    IDE::ComponentPersistence loadNameVersionId [my name] [my set componentid] $cobj
}
