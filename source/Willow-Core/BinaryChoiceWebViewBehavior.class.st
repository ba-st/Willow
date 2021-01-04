"
I'm an abstract class representing binary choice web views
"
Class {
	#name : #BinaryChoiceWebViewBehavior,
	#superclass : #WAPainter,
	#instVars : [
		'interested',
		'iterator'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #testing }
BinaryChoiceWebViewBehavior class >> isAbstract [

	^ self name = #BinaryChoiceWebViewBehavior
]

{ #category : #'instance creation' }
BinaryChoiceWebViewBehavior class >> onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff [

	^self new initializeOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebViewBehavior >> allows: aModel [

	^iterator includes: aModel 
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebViewBehavior >> currentSelection [

	^iterator current 
]

{ #category : #initialization }
BinaryChoiceWebViewBehavior >> initializeOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff [

	iterator := CircularIterator
		cyclingOver:
			{anObjectToUseWhenOn.
			anObjectToUseWhenOff}.
	interested := Set new
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebViewBehavior >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
BinaryChoiceWebViewBehavior >> notifyInterested [

	interested do: [ :anInterested | anInterested changeNotifiedBy: self ]
]

{ #category : #configuring }
BinaryChoiceWebViewBehavior >> on [

	^ self subclassResponsibility
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebViewBehavior >> selectOffModel [

	iterator reset.
	self toggleCurrentSelection.
	self notifyInterested  
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebViewBehavior >> selectOnModel [

	iterator reset.
	self notifyInterested 
]

{ #category : #'Binary Choice-API' }
BinaryChoiceWebViewBehavior >> toggleCurrentSelection [

	iterator next.
	self notifyInterested  
]
