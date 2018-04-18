"
I'm an error handler supporting a different handling for AJAX requests
"
Class {
	#name : #AjaxAwareErrorHandler,
	#superclass : #WAHtmlErrorHandler,
	#instVars : [
		'reportingAction',
		'ajaxExceptionHandlers',
		'rootCommand',
		'nonAjaxRenderBlock'
	],
	#category : 'Willow-Applications'
}

{ #category : #actions }
AjaxAwareErrorHandler >> handleDefault: anException [

	self valueReportingActionWhenHandling: anException.
	self requestContext request isXmlHttpRequest
		ifTrue: [ self respondToXmlHttpRequestWith: anException messageText ]
		ifFalse: [ super handleDefault: anException ]
]

{ #category : #actions }
AjaxAwareErrorHandler >> handleException: anException [

	self requestContext request isXmlHttpRequest
		ifTrue: [
			^ajaxExceptionHandlers keys
				detect: [:key | key handles: anException]
				ifFound: [:key | (ajaxExceptionHandlers at: key) cull: anException cull: self]
				ifNone: [super handleException: anException]].

	^super handleException: anException
]

{ #category : #initialization }
AjaxAwareErrorHandler >> initializeDefaults [

	ajaxExceptionHandlers := GRSmallDictionary new.
	self
		reportingAction: [ :errorHandler |  ];
		updateRootWith: [ :root |  ];
		renderNonAjaxErrorsWith: [ :canvas :exception | super renderContentForException: exception on: canvas ]
]

{ #category : #initialization }
AjaxAwareErrorHandler >> initializeWithContext: aRequestContext [

	super initializeWithContext: aRequestContext.
	self initializeDefaults
]

{ #category : #Configuring }
AjaxAwareErrorHandler >> on: anExceptionSelector do: aBlock [

	ajaxExceptionHandlers at: anExceptionSelector put: aBlock
]

{ #category : #private }
AjaxAwareErrorHandler >> renderContentForException: anException on: html [

	nonAjaxRenderBlock value: html value: anException 
]

{ #category : #Configuring }
AjaxAwareErrorHandler >> renderNonAjaxErrorsWith: aDyadicBlock [

	nonAjaxRenderBlock := aDyadicBlock
]

{ #category : #Configuring }
AjaxAwareErrorHandler >> reportingAction: aDyadicBlock [

	reportingAction := aDyadicBlock
]

{ #category : #actions }
AjaxAwareErrorHandler >> respondToXmlHttpRequestWith: aMessageText [

	self requestContext
		respond: [ :response | 
			response
				internalError;
				contentType:
					(WAMimeType textHtml
						charset: self requestContext charSet;
						yourself);
				nextPutAll: aMessageText ]
]

{ #category : #private }
AjaxAwareErrorHandler >> updateHtmlRoot: root forException: anException [

	super updateHtmlRoot: root forException: anException.
	rootCommand value: root.
]

{ #category : #Configuring }
AjaxAwareErrorHandler >> updateRootWith: aBlock [

	rootCommand := aBlock
]

{ #category : #actions }
AjaxAwareErrorHandler >> valueReportingActionWhenHandling: anException [

	reportingAction cull: self cull: anException
]
