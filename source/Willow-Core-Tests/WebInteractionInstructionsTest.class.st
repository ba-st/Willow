"
A WebInteractionInstructionsTest is a test class for testing the behavior of WebInteractionInstructions
"
Class {
	#name : #WebInteractionInstructionsTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #tests }
WebInteractionInstructionsTest >> testAppendToOn [

	| stream instructions |

	stream := JSStream on: 'Number is '.
	instructions := WebInteractionInstructions
		directingTo: [ :canvas | JSStream on: canvas size asString ].
	instructions appendTo: stream on: #(1 7 5).
	self assert: stream contents equals: 'Number is 3'
]

{ #category : #tests }
WebInteractionInstructionsTest >> testCombinedWith [

	| stream instructions otherInstructions |

	stream := JSStream on: 'Values are '.
	instructions := WebInteractionInstructions
		directingTo: [ :canvas | JSStream on: canvas size asString ].
	otherInstructions := WebInteractionInstructions
		directingTo: [ :canvas | JSStream on: canvas last asString ].
	( instructions combinedWith: otherInstructions ) appendTo: stream on: #(1 7 5).
	self assert: stream contents equals: 'Values are 35'
]

{ #category : #tests }
WebInteractionInstructionsTest >> testCombinedWithWhenBothAreEmpty [

	| stream instructions otherInstructions |

	stream := JSStream on: 'Values not here'.
	instructions := WebInteractionInstructions empty.
	otherInstructions := WebInteractionInstructions empty.
	( instructions combinedWith: otherInstructions ) appendTo: stream on: #(1 7 5).
	self assert: stream contents equals: 'Values not here'
]

{ #category : #tests }
WebInteractionInstructionsTest >> testCombinedWithWhenFirstIsEmpty [

	| stream instructions otherInstructions |

	stream := JSStream on: 'Values are '.
	instructions := WebInteractionInstructions empty.
	otherInstructions := WebInteractionInstructions
		directingTo: [ :canvas | JSStream on: canvas last asString ].
	( instructions combinedWith: otherInstructions ) appendTo: stream on: #(1 7 5).
	self assert: stream contents equals: 'Values are 5'
]

{ #category : #tests }
WebInteractionInstructionsTest >> testCombinedWithWhenSecondIsEmpty [

	| stream instructions otherInstructions |

	stream := JSStream on: 'Values are '.
	instructions := WebInteractionInstructions
		directingTo: [ :canvas | JSStream on: canvas size asString ].
	otherInstructions := WebInteractionInstructions empty.
	( instructions combinedWith: otherInstructions ) appendTo: stream on: #(1 7 5).
	self assert: stream contents equals: 'Values are 3'
]

{ #category : #tests }
WebInteractionInstructionsTest >> testDirectingTo [

	| instructions |

	instructions := WebInteractionInstructions directingTo: [ :canvas | canvas asString ].
	self
		deny: instructions isEmpty;
		assert: instructions notEmpty.

	self assertCollection: ( instructions statementsOn: 8 ) equals: ( Array with: '8' )
]

{ #category : #tests }
WebInteractionInstructionsTest >> testEmpty [
|instructions|
instructions  := WebInteractionInstructions empty.
self assert: instructions isEmpty;
deny: instructions notEmpty.

self assert: (instructions statementsOn: self ) isEmpty

]

{ #category : #tests }
WebInteractionInstructionsTest >> testIsEmpty [

	| instructions |

	instructions := WebInteractionInstructions directingTo: [ :canvas | canvas asString ].
	self deny: instructions isEmpty
]

{ #category : #tests }
WebInteractionInstructionsTest >> testNotEmpty [

	| instructions |

	instructions := WebInteractionInstructions directingTo: [ :canvas | canvas asString ].
	self assert: instructions notEmpty
]

{ #category : #tests }
WebInteractionInstructionsTest >> testStatementsOn [

	| instructions |

	instructions := WebInteractionInstructions directingTo: [ :canvas | canvas asString ].
	self assertCollection: ( instructions statementsOn: 8 ) equals: ( Array with: '8' )
]
