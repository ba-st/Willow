"
I'm a WALibrary serving the files from the official CDN.
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
		anonymousSubResourceIntegrity: 'sha384-ZvpUoO/+PpLXR1lu4jmpXWu80pZlYUAfxl5NsBMWOEPSjUn/6Z/hRTt8+pR6L4N2'
]

{ #category : #Accessing }
JQuery3OnlineLibrary >> version [

	^ '3.5.1'
]
