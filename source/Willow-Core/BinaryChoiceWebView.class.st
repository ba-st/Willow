"
I'm an abstract class representing binary choice web views
"
Class {
	#name : #BinaryChoiceWebView,
	#superclass : #WAPainter,
	#instVars : [
		'interested',
		'iterator'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #testing }
BinaryChoiceWebView class >> isAbstract [

	^ self name = #BinaryChoiceWebView
]

{ #category : #'instance creation' }
BinaryChoiceWebView class >> onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff [

	^self new initializeOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebView >> allows: aModel [

	^ iterator includes: aModel
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebView >> currentSelection [

	^ iterator current
]

{ #category : #initialization }
BinaryChoiceWebView >> initializeOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff [

	iterator := CircularIterator
		cyclingOver:
			{anObjectToUseWhenOn.
			anObjectToUseWhenOff}.
	interested := Set new
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebView >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
BinaryChoiceWebView >> notifyInterested [

	interested do: [ :anInterested | anInterested changeNotifiedBy: self ]
]

{ #category : #configuring }
BinaryChoiceWebView >> on [

	^ self subclassResponsibility
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebView >> selectOffModel [

	iterator reset.
	self toggleCurrentSelection.
	self notifyInterested  
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebView >> selectOnModel [

	iterator reset.
	self notifyInterested 
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebView >> toggleCurrentSelection [

	iterator next.
	self notifyInterested  
]
