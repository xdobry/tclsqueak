IDE::DestroyMixForward instproc destroy {} {
    catch {my instanceDestroying}
    next
}
