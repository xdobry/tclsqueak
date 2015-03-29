IDE::ConfigmapControler proc editSave text {
    my instvar selectedVersion view viewType
    switch $viewType {
        Comment {
            $selectedVersion setComment $text
        }
        preStartScript {
            $selectedVersion prescript $text
            $selectedVersion updateAttributes prescript
        }
        startScript {
            $selectedVersion postscript $text
            $selectedVersion updateAttributes postscript
        }
    }
}
