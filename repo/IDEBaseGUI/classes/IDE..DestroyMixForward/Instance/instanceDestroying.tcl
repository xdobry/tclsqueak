IDE::DestroyMixForward instproc instanceDestroying {} {
    my instvar destroyForwardObjs
    foreach obj $destroyForwardObjs {
        catch {$obj instanceDestroying}
    }
}
