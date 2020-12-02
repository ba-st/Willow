"
I'm a WALibary serving the files from the official CDN.
"
Class {
	#name : #JQuery3OnlineLibrary,
	#superclass : #WAOnlineLibrary,
	#category : #'Willow-Core-Libraries'
}

{ #category : #Updating }
JQuery3OnlineLibrary >> updateRoot: aRoot [

	aRoot javascript
		url: ( 'https://code.jquery.com/jquery-<1s>.min.js' expandMacrosWith: self version );
		anonymousSubResourceIntegrity: 'sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ='
]

{ #category : #Accessing }
JQuery3OnlineLibrary >> version [

	^ '3.5.0'
]
