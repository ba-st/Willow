"
I'm a library providing some basic object used to define and access some utility functions.
"
Class {
	#name : #WillowNamespaceFileMetadataLibrary,
	#superclass : #WADeploymentAwareFileMetadataLibrary,
	#category : 'Willow-Libraries'
}

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary class >> forDeployment [

	^ self 
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary class >> forDevelopment [

	^ self 
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary class >> libraryName [

	^ 'willow'
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary class >> version [

	^ '8.0.0'

]

{ #category : #private }
WillowNamespaceFileMetadataLibrary >> callServerFunction [

	| function |

	function := JSFunction new arguments: (Array with: self sessionInformation asJavascript).
	function << (self sessionInformation property: 'dataType') assign: 'script'.
	function << (self sessionInformation property: 'error')
		assign: WillowJavascriptNamespace new handleAjaxErrorCallFunction.
	function << function jQuery call: 'ajax' with: self sessionInformation.
	^ function
]

{ #category : #private }
WillowNamespaceFileMetadataLibrary >> defaultHandleAjaxErrorCallFunction [

	^ JSFunction new arguments: #(xmlHttpRequest textStatus errorThrown)
]

{ #category : #private }
WillowNamespaceFileMetadataLibrary >> globalWillowNamespaceDeclaration [

	^ JSDeclareGlobalNamespace named: self willowNamespace
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary >> jswillowJs [

	^ WAFileLibraryResource
		filepath: 'js/willow.js'
		mimeType: WAMimeType textJavascript
		cacheDuration:
			(Duration
				days: 0
				hours: 0
				minutes: 30
				seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #jswillowJsContent)
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary >> jswillowJsContent [

	^ '/*!
* willow.js v<1s>
* Copyright 2018 - Buenos Aires Smalltalk
* Licensed under the MIT license
*/

"use strict";
<2s>'
		expandMacrosWith: self version
		with:
			(self
				javascriptContentFrom: [ :script | 
					script << self globalWillowNamespaceDeclaration.
					script << (script javascript if: (self willowNamespace identicalTo: JSStream undefined) then: (self willowNamespace assign: self willowDefaults)) ])
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary >> nonFileSelectors [

	^ OrderedCollection new
		addAll: super nonFileSelectors;
		addAll: #(globalWillowNamespaceDeclaration willowNamespace defaultHandleAjaxErrorCallFunction sessionInformation willowDefaults callServerFunction);
		yourself
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary >> selectorsToInclude [

	^ #(jswillowJs)
]

{ #category : #private }
WillowNamespaceFileMetadataLibrary >> sessionInformation [

	^ JSStream on: 'sessionInformation'
]

{ #category : #Accessing }
WillowNamespaceFileMetadataLibrary >> version [

	^self class version
]

{ #category : #private }
WillowNamespaceFileMetadataLibrary >> willowDefaults [

	^ GRSmallDictionary new
		at: 'version' put: self version;
		at: WillowConstants handleAjaxErrorCallFunctionName
			put: self defaultHandleAjaxErrorCallFunction;
		at: WillowConstants callServerFunctionName put: self callServerFunction;
		yourself
]

{ #category : #private }
WillowNamespaceFileMetadataLibrary >> willowNamespace [

	^ WillowJavascriptNamespace new
]
