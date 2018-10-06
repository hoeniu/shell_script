My requirement is to run custom protocol handler using browser in linux systems.

(1) set 1 
    modyfy elemchain.desktop 
	
	[Desktop Entry]
	Name=name
	Exec=executableFileLocation %u
	Type=Application
	Terminal=true
	MimeType=x-scheme-handler/name;

	modyfy mimeapps.list
	x-scheme-handler/elemchain=name.desktop

(2) set 2 
	upadate cache 
	copy mimeapps.list and name.desktop to ~/.local/share/applications
