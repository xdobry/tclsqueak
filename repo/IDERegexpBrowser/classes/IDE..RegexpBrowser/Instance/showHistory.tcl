IDE::RegexpBrowser instproc showHistory args {
    my instvar data v_history historyWin
    if {$v_history} {wm deiconify $historyWin} else {wm iconify $historyWin}
}
