IDE::RepositoryImporter instproc disconnectRepository {} {
    my instvar exportRepository win configmaps_arr
    if {[info exists exportRepository] && $exportRepository ne ""} {
        $exportRepository destroy
        set exportRepository ""
        catch {unset configmaps_arr}
    }
    catch {
        $win.connectionlab configure -text "disconnected"
        [self]::confgrups setList {}
        [self]::configmaps setList {}
    }
}
