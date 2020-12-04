Extension { #name : #WATagBrush }

{ #category : #'*Willow-Core' }
WATagBrush >> apply: aBlockOrComponentCommand [

	aBlockOrComponentCommand asWebComponentCommand applyTo: self on: canvas
]

{ #category : #'*Willow-Core' }
WATagBrush >> interactUsing: anInteractionInterpreter [

	anInteractionInterpreter applyTo: self on: canvas
]

{ #category : #'*Willow-Core' }
WATagBrush >> with: aRenderable applying: aBlockOrWebComponentCommand [

	self
		apply: aBlockOrWebComponentCommand;
		with: aRenderable
]
