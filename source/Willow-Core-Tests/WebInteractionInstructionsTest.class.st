"
A WebInteractionInstructionsTest is a test class for testing the behavior of WebInteractionInstructions
"
Class {
	#name : #WebInteractionInstructionsTest,
	#superclass : #BWRenderingTest,
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

	instructions := WebInteractionInstructions directingTo: [ :canvas | 'this will be returned' ].
	self
		deny: instructions isEmpty;
		assert: instructions notEmpty.

	self
		renderUsing: [ :canvas | 
			self
				assertCollection: ( instructions statementsOn: canvas )
				equals: ( Array with: 'this will be returned' )
			]
]

{ #category : #tests }
WebInteractionInstructionsTest >> testDirectingToOrderedAt [

	| instructions otherInstructions combinedInstructions |

	instructions := WebInteractionInstructions directingTo: [ :canvas | 'then this one' ] orderedAt: 30.
	otherInstructions := WebInteractionInstructions
		directingTo: [ :canvas | 'first thins one' ]
		orderedAt: 10.
	combinedInstructions := instructions combinedWith: otherInstructions.
	self
		deny: combinedInstructions isEmpty;
		assert: combinedInstructions notEmpty.

	self
		renderUsing: [ :canvas | 
			self
				assertCollection: ( combinedInstructions statementsOn: canvas )
				equals: ( Array with: 'first thins one' with: 'then this one' )
			]
]

{ #category : #tests }
WebInteractionInstructionsTest >> testEmpty [

	| instructions |

	instructions := WebInteractionInstructions empty.
	self
		assert: instructions isEmpty;
		deny: instructions notEmpty.

	self renderUsing: [ :canvas | self assert: ( instructions statementsOn: canvas ) isEmpty ]
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

	instructions := WebInteractionInstructions directingTo: [ :canvas | 'this will be returned' ].
	self
		renderUsing: [ :canvas | 
			self
				assertCollection: ( instructions statementsOn: canvas )
				equals: ( Array with: 'this will be returned' )
			]
]
