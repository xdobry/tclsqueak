IDE::User proc createDefault {} {
    set user [my getSystemUser]
    #we do not want to ask the user for it. TODO perhaps set later for example email adress
    #set longname [IDE::IDialogEntry getValue "The System User $user is unknown for xotclIDE. Please enter long name for the user"]
    set inst [my create [self]::default]
    $inst set name $user
    $inst set longname $user

    $inst makePersistent
}
