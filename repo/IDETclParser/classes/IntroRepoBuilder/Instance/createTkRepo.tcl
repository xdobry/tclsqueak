IntroRepoBuilder instproc createTkRepo {} {
    set widgets {button checkbutton radiobutton menubutton label frame labelframe message menu scale scrollbar listbox entry spinbox text canvas frame toplevel panedwindow}
    foreach w $widgets {
        my buildWidget $w
    }

}
