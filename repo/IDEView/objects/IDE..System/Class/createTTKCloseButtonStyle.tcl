IDE::System proc createTTKCloseButtonStyle {} {
    ttk::style element create smallclose vsapi WINDOW 19 {disabled 4 pressed 3 active 2 {} 1}
    ttk::style layout CloseButton {CloseButton.smallclose -sticky news}
}
