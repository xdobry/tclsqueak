IDE::DialogHelper instproc cleanUpAfterSignal {} {
    my instvar oldFocus oldGrab win grabStatus
    catch {focus $oldFocus}
    catch {
        # It's possible that the window has already been destroyed,
        # hence this "catch".  Delete the Destroy handler so that
        # tkPriv(button) doesn't get reset by it.

        bind $win <Destroy> {}
        destroy $win
    }
    my unGrab
}
