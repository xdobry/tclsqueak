IDE::InstallerGUI instproc doFinish {} {
    [self] instvar win
    IDE::Dialog message {Installation of XotclIDE Control Version System is finished

Please use 'XotclIDEDB' to Start IDE with VC
Use 'XotclIDEFromDB.tcl' to develop IDE itself (It start IDE from Components in VC).

Please report the Bugs!. Have a Fun with XotclIDE!}
    [self] destroy
    exit
}
