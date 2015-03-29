IDE::ConfigmapBrowser instproc fillMenuStruct aMenuStruct {
    $aMenuStruct addCommand {Reload All} {IDE::ConfigmapControler reloadConfigmaps}
    $aMenuStruct addCommand {Some Help} {IDE::Dialog message "Use pop-up menus to perform actions. Warning! This configuration tool is in alfa state"}
}
