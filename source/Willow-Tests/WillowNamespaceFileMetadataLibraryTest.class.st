"
A WillowNamespaceFileMetadataLibraryTest is a test class for testing the behavior of WillowNamespaceFileMetadataLibrary
"
Class {
	#name : #WillowNamespaceFileMetadataLibraryTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Libraries'
}

{ #category : #tests }
WillowNamespaceFileMetadataLibraryTest >> testDeployFiles [

	self
		useFileTestingPlatformDuring: [ WillowNamespaceFileMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('willow-7.0.0' 'willow-7.0.0/js');
				assert: GRPlatform current createdFiles equals: #('willow-7.0.0/js/willow.js') ]

]

{ #category : #tests }
WillowNamespaceFileMetadataLibraryTest >> testInstanceCreation [

	self
		assert: WillowNamespaceFileMetadataLibrary forDeployment equals: WillowNamespaceFileMetadataLibrary;
		assert: WillowNamespaceFileMetadataLibrary forDevelopment equals: WillowNamespaceFileMetadataLibrary
]

{ #category : #tests }
WillowNamespaceFileMetadataLibraryTest >> testJavascriptCode [

	self
		assert: WillowNamespaceFileMetadataLibrary default jswillowJsContent
		equals:
			'/*!
* willow.js v7.0.0
* Copyright 2018 - Buenos Aires Smalltalk
* Licensed under the MIT license
*/

"use strict";
var Willow;if(Willow===undefined){Willow={"version":"7.0.0","handleAjaxErrorCall":function(xmlHttpRequest,textStatus,errorThrown){},"callServer":function(sessionInformation){sessionInformation["dataType"]="script";sessionInformation["error"]=Willow.handleAjaxErrorCall;$.ajax(sessionInformation)}}}'

]

{ #category : #tests }
WillowNamespaceFileMetadataLibraryTest >> testTesting [

	self
		assert: WillowNamespaceFileMetadataLibrary isForDeployment;
		assert: WillowNamespaceFileMetadataLibrary isForDevelopment
]
