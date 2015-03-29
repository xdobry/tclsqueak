IDE::XOIntroProxy instproc unloadObject object {
   IDE::CommentsContainer destroyObject ::$object
   $object destroy
}
