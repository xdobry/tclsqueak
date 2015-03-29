IDE::ClassSelector proc getUnregisteredClass {} {
    IDE::IDialogListFilter selectFromList {Choose the class} [[IDE::XOIntroProxy getIntroProxy] getUnregisteredClasses]
}
