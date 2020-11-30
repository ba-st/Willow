"
I'm an abstract test case for views implementing the single selection API
"
Class {
	#name : #SingleSelectionWebViewTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : #'Willow-Tests-WebViews'
}

{ #category : #testing }
SingleSelectionWebViewTest class >> isAbstract [

	^self name = #SingleSelectionWebViewTest
]

{ #category : #support }
SingleSelectionWebViewTest >> changeNotifiedBy: aDropDownListWebView [ 
	
	notificationWasReceived := true
]

{ #category : #support }
SingleSelectionWebViewTest >> newSingleSelectionView [

	^self subclassResponsibility 
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testAllowsAnySatisfying [

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.

	self deny: (singleSelectionView allowsAnySatisfying: [ :element | true ]).

	singleSelectionView allowAnyOf: #(1 2 3 4).

	self
		assert: (singleSelectionView allowsAnySatisfying: [ :element | element even ]);
		deny: (singleSelectionView allowsAnySatisfying: [ :element | element isZero ])
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testChooseAny [

	| singleSelectionView allowedElements |

	singleSelectionView := self newSingleSelectionView.

	singleSelectionView chooseAny.

	self should: [ singleSelectionView currentSelection ] raise: SelectionIsInvalid.

	allowedElements := #(1 2 3 4).

	singleSelectionView
		allowAnyOf: allowedElements;
		chooseAny.

	self assert: (allowedElements includes: singleSelectionView currentSelection)
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testChooseEqualTo [

	| singleSelectionView allowedElements |

	singleSelectionView := self newSingleSelectionView.

	self should: [ singleSelectionView chooseEqualTo: 3 ] raise: SelectionIsInvalid.

	self should: [ singleSelectionView currentSelection ] raise: SelectionIsInvalid.

	allowedElements := #(1 2 3 4).

	singleSelectionView
		allowAnyOf: allowedElements;
		chooseEqualTo: 2.

	self assert: singleSelectionView currentSelection equals: 2.

	singleSelectionView chooseEqualTo: 4.

	self assert: singleSelectionView currentSelection equals: 4
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testNotifyChangesTo [

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := false.
	singleSelectionView disallowAll.

	self assert: notificationWasReceived
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testNotifyChangesWhenAvailableElementsChangeButContainsTheSelectedOne [

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).

	singleSelectionView notifyChangesTo: self.
	singleSelectionView chooseAnySatisfying: [ :element | element = 1 ] ifNone: [ self fail ].

	notificationWasReceived := false.

	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1.

	singleSelectionView allowAnyOf: #(2 4 3 1).

	self assert: notificationWasReceived.
	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testNotifyChangesWhenAvailableElementsChangeButDoesNotContainTheSelectedOne [

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).

	singleSelectionView notifyChangesTo: self.
	singleSelectionView chooseAnySatisfying: [ :element | element = 1 ] ifNone: [ self fail ].

	notificationWasReceived := false.

	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1.

	singleSelectionView allowAnyOf: #(2 4).

	self
		assert: notificationWasReceived;
		assert: (singleSelectionView currentSelectionIfNone: [ 0 ]) equals: 0
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testNotifyChangesWhenSelectionChanged [

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).

	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := false.
	singleSelectionView chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].

	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1.
	self assert: notificationWasReceived
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testNotifyChangesWhenSelectionDoesNotChange [

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).
	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := true.

	singleSelectionView chooseAnySatisfying: [ :element | false ] ifNone: [ notificationWasReceived := false ].

	self
		deny: notificationWasReceived;
		assert: (singleSelectionView currentSelectionIfNone: [ 0 ]) equals: 0
]

{ #category : #'tests-Single Selection-API' }
SingleSelectionWebViewTest >> testWithCurrentSelectionDo [

	| singleSelectionView allowedElements |

	singleSelectionView := self newSingleSelectionView.

	singleSelectionView withCurrentSelectionDo: [ :selectedElement | self fail ].

	allowedElements := #(1 2 3 4).
	singleSelectionView
		allowAnyOf: allowedElements;
		chooseAny.

	singleSelectionView withCurrentSelectionDo: [ :selectedElement | self assert: (allowedElements includes: selectedElement) ]
]
