IntroRepoBuilder instproc createTTkRepo {} {
    set widgets {ttk::separator ttk::sizegrip ttk::checkbutton ttk::combobox ttk::entry ttk::treeview ttk::frame ttk::labelframe ttk::menubutton ttk::notebook ttk::panedwindow ttk::progressbar ttk::radiobutton ttk::scale ttk::scrollbar ttk::label ttk::button}
    foreach w $widgets {
        my buildWidget $w
    }

}
