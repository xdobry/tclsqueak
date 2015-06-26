PrsMarkupVisitor instproc init {} {
    my set definitionsKey [list]
    my set definitions [list]
    my set varDefinitions [list]
    my set varLocalDefinitions [list]
    my set varIndex 0
    my set errors [list]
    my set errorIndex 1
    my set files [list]

    my set tkCommands [lsort {bell frame	panedwindow	tk_focusFollowsMouse	toplevel	ttk::separator
bind	grab	photo	tk_focusNext	ttk::button	ttk::sizegrip
bindtags	grid	place	tk_focusPrev	ttk::checkbutton	ttk::spinbox
bitmap	image	radiobutton	tk_getOpenFile	ttk::combobox	ttk::style
button	keysyms	raise	tk_getSaveFile	ttk::entry	ttk::treeview
canvas	label	scale	tk_menuSetFocus	ttk::frame	ttk::widget
checkbutton	labelframe	scrollbar	tk_messageBox	ttk::intro	ttk_image
clipboard	listbox	selection	tk_optionMenu	ttk::label	ttk_vsapi
colors	loadTk	send	tk_popup	ttk::labelframe	winfo
console	lower	spinbox	tk_setPalette	ttk::menubutton	wm
cursors	menu	text	tk_textCopy	ttk::notebook
destroy	menubutton	tk	tk_textCut	ttk::panedwindow
entry	message	tk_bisque	tk_textPaste	ttk::progressbar
event	option	tk_chooseColor	tkerror	ttk::radiobutton
focus	options	tk_chooseDirectory	tkvars	ttk::scale
font	pack	tk_dialog	tkwait	ttk::scrollbar}]
    my set tclCommands [lsort {tell socket subst open eof pwd glob list pid exec auto_load_index time unknown eval lassign lrange fblocked lsearch auto_import gets case lappend variable llength auto_execok linsert error catch clock info split array fconfigure concat join lreplace source fcopy global switch auto_qualify update close cd auto_load file append lrevers e format unload read package binary namespace scan apply trace seek zlib chan flush after vwait dict uplevel lset rename rechan fileevent regexp lrepeat upvar encoding expr unset load regsub history interp exit lsort tclLog string}]
    my array set packageArr {
        tk http://www.tcl.tk/man/tcl8.5/TkCmd/contents.htm
        mysqltcl http://www.xdobry.de/mysqltcl/
        XOTcl http:://www.xotcl.org
        tdom http:://www.tdom.org
        Itcl http://incrtcl.sourceforge.net/itcl/
        sqlite3 http://www.sqlite.org/tclsqlite.html
        tcom http://www.vex.net/~cthuang/tcom/
    }
}
