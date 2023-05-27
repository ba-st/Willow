"
I'm an asbtract WALibrary serving the files in source form
"
Class {
	#name : #JQuery3MetadataLibrary,
	#superclass : #WADeploymentAwareFileMetadataLibrary,
	#category : #'Willow-Core-Libraries'
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

{ #category : #Accessing }
JQuery3MetadataLibrary class >> version [

	^ '3.7.0'
]
