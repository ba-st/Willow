"
A WillowNamespaceFileMetadataLibraryTest is a test class for testing the behavior of WillowNamespaceFileMetadataLibrary
"
Class {
	#name : #WillowNamespaceFileMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Libraries'
}

{ #category : #tests }
WillowNamespaceFileMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: WillowNamespaceFileMetadataLibrary default deployFiles
		createsAsFolders:
			{'willow-8.0.1'.
			( 'willow-8.0.1<1s>js' expandMacrosWith: GRPlatform current pathSeparator )}
		andFileContentsMatching:
			{( ( 'willow-8.0.1<1s>js/willow.js' expandMacrosWith: GRPlatform current pathSeparator )
				-> 'd01dced3b8eed675fe45b1f8a3cb3470c730150b' )}
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
* willow.js v8.0.1
* Copyright 2018 - Buenos Aires Smalltalk
* Licensed under the MIT license
*/

"use strict";
var Willow;if(Willow===undefined){Willow={"version":"8.0.1","handleAjaxErrorCall":function(xmlHttpRequest,textStatus,errorThrown){},"callServer":function(sessionInformation){sessionInformation["dataType"]="script";sessionInformation["error"]=Willow.handleAjaxErrorCall;$.ajax(sessionInformation)}}}'

]

{ #category : #tests }
WillowNamespaceFileMetadataLibraryTest >> testTesting [

	self
		assert: WillowNamespaceFileMetadataLibrary isForDeployment;
		assert: WillowNamespaceFileMetadataLibrary isForDevelopment
]
