IDE::ProcToMethodWizzard proc convertProcedures procs {
    my new [Object autoname .procconverter] [list -procedures $procs]
}
