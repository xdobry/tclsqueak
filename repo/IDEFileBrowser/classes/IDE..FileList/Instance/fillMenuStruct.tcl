IDE::FileList instproc fillMenuStruct ms {
     $ms enablementHandler [self]   
     $ms addCommand2 {Copy} [list [self] dispatchWithSelectedAll copyFiles] isValidSelection
     $ms addCommand2 {Cut} [list [self] dispatchWithSelectedAll cutFiles] isValidSelection
     $ms addCommand2 {Paste} [list [self] pasteFiles] canPaste
     $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]
     $ms addCommand2 {Delete} [list [self] dispatchWithSelectedAll deleteFiles] isValidSelection
     $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]
     $ms addCommand2 {Select All} [list [self] selectAll]
     $ms addCommand2 {Select Pattern} [list [self] selectGlob]
     $ms addCommand2 {Edit in Workspace} [list [self] dispatchWithSelected viewFile] isValidSelection
     $ms addCommand2 {Rename} [list [self] dispatchWithSelected renameFile] isValidSelection
     $ms addCommand2 {Properties} [list [self] dispatchWithSelected showProperties] isValidSelection
     
     $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]
     $ms addCommand2 {Mount Zip} [list [self] dispatchWithSelected mountZip] {isValidSelection isSelectionFile}
     $ms addCommand2 {Mount Kit} [list [self] dispatchWithSelected mountKit] {isValidSelection isSelectionFile}
}
