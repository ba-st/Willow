Class {
	#name : #JQuery3FileMetadataLibraryTest,
	#superclass : #TestCase,
	#category : #'Willow-Tests-Libraries'
}

{ #category : #tests }
JQuery3FileMetadataLibraryTest >> testForDeployment [

	self assert: JQuery3MetadataLibrary forDeployment equals: JQuery3DeploymentMetadataLibrary
]

{ #category : #tests }
JQuery3FileMetadataLibraryTest >> testForDevelopment [

	self assert: JQuery3MetadataLibrary forDevelopment equals: JQuery3DevelopmentMetadataLibrary
]

{ #category : #tests }
JQuery3FileMetadataLibraryTest >> testLibraryName [

	self assert: JQuery3MetadataLibrary libraryName equals: 'jQuery'
]

{ #category : #tests }
JQuery3FileMetadataLibraryTest >> testVersion [

	self assert: JQuery3MetadataLibrary version equals: '3.5.0'
]

{ #category : #tests }
JQuery3FileMetadataLibraryTest >> testVersionCompatibility [

	self
		assert: JQuery3DeploymentMetadataLibrary version equals: JQuery3DevelopmentMetadataLibrary version;
		assert: JQuery3DeploymentMetadataLibrary version equals: JQuery3OnlineLibrary default version
]
