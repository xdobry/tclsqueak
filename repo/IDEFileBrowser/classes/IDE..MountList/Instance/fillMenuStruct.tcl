IDE::MountList instproc fillMenuStruct ms {
     $ms enablementHandler [self]   
     $ms addCommand2 {Unmount} [list [self] dispatchWithSelectedAll unmountFile] isMountfile
}
