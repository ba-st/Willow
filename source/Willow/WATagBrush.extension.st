Extension { #name : #WATagBrush }

{ #category : #'*Willow' }
WATagBrush >> apply: aBlockOrComponentCommandOrInterpreter [

	| commandOrInterpreter |

	commandOrInterpreter := aBlockOrComponentCommandOrInterpreter isBlock
		ifTrue: [ aBlockOrComponentCommandOrInterpreter asWebComponentCommand ]
		ifFalse: [ aBlockOrComponentCommandOrInterpreter ].
	commandOrInterpreter applyTo: self on: canvas
]

{ #category : #'*Willow' }
WATagBrush >> with: aRenderable applying: aBlockOrWebComponentCommand [

	self
		apply: aBlockOrWebComponentCommand;
		with: aRenderable
]
