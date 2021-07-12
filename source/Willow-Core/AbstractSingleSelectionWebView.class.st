"
I'm an abstract class representing single selection web views
"
Class {
	#name : #AbstractSingleSelectionWebView,
	#superclass : #WAPainter,
	#instVars : [
		'availableElements',
		'interested',
		'chosenElementOptional'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #testing }
AbstractSingleSelectionWebView class >> isAbstract [

	^ self = AbstractSingleSelectionWebView
]

{ #category : #'instance creation' }
AbstractSingleSelectionWebView class >> new [

	^ super new initialize
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> allowAnyOf: anElementCollection [

	availableElements := anElementCollection.
	"Try to keep the current selection, if the new elements includes some object equal to the previous selection make it the chosen one."
	self chooseAnySatisfying: [ :element | chosenElementOptional withContentDo: [ :chosenElement | chosenElement = element ] ifUnused: [ false ] ] ifNone: [ self invalidateSelection ]
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> allowsAnySatisfying: aMatchBlock [

	^availableElements anySatisfy: aMatchBlock
]

{ #category : #private }
AbstractSingleSelectionWebView >> choose: anElement [

	chosenElementOptional := Optional containing: anElement.
	self notifyInterested
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> chooseAny [

	self chooseAnySatisfying: [ :element | true ] ifNone: [  ]
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> chooseAnySatisfying: aMatchBlock ifNone: aBlock [

	availableElements detect: aMatchBlock ifFound: [ :found | self choose: found ] ifNone: aBlock
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> chooseEqualTo: anElement [

	self
		chooseAnySatisfying: [ :element | element = anElement ]
		ifNone: [ SelectionIsInvalid signal: ('There''s no available object equal to <1p>' expandMacrosWith: anElement) ]
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> currentSelection [

	^ self currentSelectionIfNone: [ SelectionIsInvalid signal: 'Nothing is selected' ]
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> currentSelectionIfNone: aBlock [

	^ chosenElementOptional withContentDo: [ :element | element ] ifUnused: aBlock
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> disallowAll [

	availableElements := #().
	self invalidateSelection
]

{ #category : #initialization }
AbstractSingleSelectionWebView >> initialize [

	super initialize.
	interested := Set new.
	self disallowAll
]

{ #category : #private }
AbstractSingleSelectionWebView >> invalidateSelection [

	chosenElementOptional := Optional unusedBecause: 'There''s no element selected'.
	self notifyInterested
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
AbstractSingleSelectionWebView >> notifyInterested [

	interested do: [ :anInterested | anInterested changeNotifiedBy: self ]
]

{ #category : #configuring }
AbstractSingleSelectionWebView >> on [

	^ self subclassResponsibility
]

{ #category : #'Single Selection-API' }
AbstractSingleSelectionWebView >> withCurrentSelectionDo: aBlock [

	^ chosenElementOptional withContentDo: aBlock ifUnused: [  ]
]
