Extension { #name : #WATagBrush }

{ #category : #'*Willow' }
WATagBrush >> apply: aBlockOrComponentCommand [

	aBlockOrComponentCommand asWebComponentCommand applyTo: self on: canvas
]

{ #category : #'*Willow' }
WATagBrush >> interactUsing: anInteractionInterpreter [

	anInteractionInterpreter applyTo: self on: canvas
]

{ #category : #'*Willow' }
WATagBrush >> with: aRenderable applying: aBlockOrWebComponentCommand [

	self
		apply: aBlockOrWebComponentCommand;
		with: aRenderable
]
