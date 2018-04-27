"
I'm an abstract class representing single selection web views
"
Class {
	#name : #SingleSelectionWebViewBehavior,
	#superclass : #WAPainter,
	#instVars : [
		'availableElements',
		'interested',
		'chosenElementOptional'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'instance creation' }
SingleSelectionWebViewBehavior class >> new [

	^ super new initialize
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> allowAnyOf: anElementCollection [

	availableElements := anElementCollection.
	"Try to keep the current selection, if the new elements includes some object equal to the previous selection make it the chosen one."
	self chooseAnySatisfying: [ :element | chosenElementOptional withContentDo: [ :chosenElement | chosenElement = element ] ifUnused: [ false ] ] ifNone: [ self invalidateSelection ]
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> allowsAnySatisfying: aMatchBlock [

	^availableElements anySatisfy: aMatchBlock
]

{ #category : #private }
SingleSelectionWebViewBehavior >> choose: anElement [

	chosenElementOptional := Optional containing: anElement.
	self notifyInterested
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> chooseAny [

	self chooseAnySatisfying: [ :element | true ] ifNone: [  ]
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> chooseAnySatisfying: aMatchBlock ifNone: aBlock [

	availableElements detect: aMatchBlock ifFound: [ :found | self choose: found ] ifNone: aBlock
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> chooseEqualTo: anElement [

	self
		chooseAnySatisfying: [ :element | element = anElement ]
		ifNone: [ SelectionIsInvalid signal: ('There''s no available object equal to <1p>' expandMacrosWith: anElement) ]
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> currentSelection [

	^ self currentSelectionIfNone: [ SelectionIsInvalid signal: 'Nothing is selected' ]
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> currentSelectionIfNone: aBlock [

	^ chosenElementOptional withContentDo: [ :element | element ] ifUnused: aBlock
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> disallowAll [

	availableElements := #().
	self invalidateSelection
]

{ #category : #initialization }
SingleSelectionWebViewBehavior >> initialize [

	super initialize.
	interested := Set new.
	self disallowAll
]

{ #category : #private }
SingleSelectionWebViewBehavior >> invalidateSelection [

	chosenElementOptional := Optional unusedBecause: 'There''s no element selected'.
	self notifyInterested
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
SingleSelectionWebViewBehavior >> notifyInterested [

	interested do: [ :anInterested | anInterested changeNotifiedBy: self ]
]

{ #category : #configuring }
SingleSelectionWebViewBehavior >> onTrigger [

	^ self subclassResponsibility
]

{ #category : #'Single Selection-API' }
SingleSelectionWebViewBehavior >> withCurrentSelectionDo: aBlock [

	^ chosenElementOptional withContentDo: aBlock ifUnused: [  ]
]
