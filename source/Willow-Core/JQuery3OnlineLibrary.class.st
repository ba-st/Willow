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
		anonymousSubResourceIntegrity: 'sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g='
]

{ #category : #Accessing }
JQuery3OnlineLibrary >> version [

	^ '3.7.0'
]
