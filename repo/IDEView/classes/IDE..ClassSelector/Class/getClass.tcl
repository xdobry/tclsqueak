IDE::ClassSelector proc getClass {} {
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    # TODO only XOTcl classes
    set clist [ide::lcollect each [$introProxy getClasses] {string trimleft $each :}]
    IDE::IDialogListFilter selectFromList {Choose the class} $clist
}
