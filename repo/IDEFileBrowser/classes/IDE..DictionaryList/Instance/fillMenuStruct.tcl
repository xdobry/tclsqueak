IDE::DictionaryList instproc fillMenuStruct ms {
     $ms addCommand2 {New Folder} [list [[self] info parent] newFolder] 
     $ms addCommand2 {Manual cd} [list [[self] info parent] manualCD] 
     $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]
     #$ms addCommand2 {New zip Archive} [list [[self] info parent] newZipArchive] 
     $ms addCommand2 {New kit Archive} [list [[self] info parent] newKitArchive] 
     $ms addMenuItem [IDE::MenuSeparator new -childof $ms -popdownMenu 1]
     $ms addCommand2 {Refresh} [list [[self] info parent] refreshFiles] 
}
