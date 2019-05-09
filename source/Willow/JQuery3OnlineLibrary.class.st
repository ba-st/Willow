"
I'm a WALibary serving the files from the official CDN.
"
Class {
	#name : #JQuery3OnlineLibrary,
	#superclass : #WAOnlineLibrary,
	#category : #'Willow-Libraries'
}

{ #category : #Updating }
JQuery3OnlineLibrary >> updateRoot: aRoot [

	aRoot javascript
		url: ('https://code.jquery.com/jquery-<1s>.min.js' expandMacrosWith: self version);
		anonymousSubResourceIntegrity: 'sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU='
]

{ #category : #Accessing }
JQuery3OnlineLibrary >> version [

	^ '3.4.1'
]
