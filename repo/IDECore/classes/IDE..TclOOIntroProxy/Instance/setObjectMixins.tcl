IDE::TclOOIntroProxy instproc setObjectMixins {object mixinList} {
    ::oo::objdefine $object mixin $mixinList
}
