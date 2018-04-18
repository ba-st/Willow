"
I'm an asbtract WALibary serving the files in source form
"
Class {
	#name : #JQuery3MetadataLibrary,
	#superclass : #WADeploymentAwareFileMetadataLibrary,
	#category : 'Willow-Libraries'
}

{ #category : #Accessing }
JQuery3MetadataLibrary class >> forDeployment [

	^ JQuery3DeploymentMetadataLibrary
]

{ #category : #Accessing }
JQuery3MetadataLibrary class >> forDevelopment [

	^ JQuery3DevelopmentMetadataLibrary
]

{ #category : #Accessing }
JQuery3MetadataLibrary class >> libraryName [

	^ 'jQuery'
]

{ #category : #versions }
JQuery3MetadataLibrary class >> version [

	^ '3.2.1'
]
