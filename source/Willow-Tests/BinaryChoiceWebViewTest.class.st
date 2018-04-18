"
I'm an abstract test case for views implementing the binary choice  API
"
Class {
	#name : #BinaryChoiceWebViewTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : 'Willow-Tests-WebViews'
}

{ #category : #testing }
BinaryChoiceWebViewTest class >> isAbstract [

	^self name = #BinaryChoiceWebViewTest 
]

{ #category : #support }
BinaryChoiceWebViewTest >> changeNotifiedBy: aCheckboxWebView [ 
	
	notificationWasReceived := true
]

{ #category : #support }
BinaryChoiceWebViewTest >> newBinaryChoiceView [

	^self subclassResponsibility 
]

{ #category : #'tests-Binary Choice-API' }
BinaryChoiceWebViewTest >> testAllows [

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.

	self
		assert: (binaryChoiceView allows: true);
		assert: (binaryChoiceView allows: false);
		deny: (binaryChoiceView allows: 1)
]

{ #category : #'tests-Binary Choice-API' }
BinaryChoiceWebViewTest >> testControlSelection [

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.

	binaryChoiceView selectOffModel.
	self deny: binaryChoiceView currentSelection.

	binaryChoiceView selectOnModel.
	self assert: binaryChoiceView currentSelection.

	binaryChoiceView selectOffModel.
	self deny: binaryChoiceView currentSelection
]

{ #category : #'tests-Binary Choice-API' }
BinaryChoiceWebViewTest >> testCurrentSelection [

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.

	self assert: binaryChoiceView currentSelection.

	binaryChoiceView toggleCurrentSelection.
	self deny: binaryChoiceView currentSelection.

	binaryChoiceView toggleCurrentSelection.
	self assert: binaryChoiceView currentSelection
]

{ #category : #'tests-Binary Choice-API' }
BinaryChoiceWebViewTest >> testNotifyChangesWhenSelectionChanged [

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.
	binaryChoiceView notifyChangesTo: self.

	notificationWasReceived := false.
	binaryChoiceView toggleCurrentSelection.
	self assert: notificationWasReceived
]
