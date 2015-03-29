IDE::DebuggerMethodEdit instproc setEvaluationRet string {
    my instvar action
    switch $action {
        inspect {
            IDE::System inspectString $string
        }
        print {
            my appendToCursor $string
        }
        substitute {
            my appendToCursor $string
        }
    }
}
