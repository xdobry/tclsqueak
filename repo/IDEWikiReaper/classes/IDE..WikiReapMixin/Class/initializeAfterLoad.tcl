IDE::WikiReapMixin proc initializeAfterLoad {} {
    # That can couse problems bei loading
    catch {package require http}
    #IDE::Editor instmixinappend IDE::WikiReapMixin
}
