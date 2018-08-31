"
I am a range slider.
"
Class {
	#name : #RangeWebView,
	#superclass : #WAPainter,
	#instVars : [
		'commandToComponent',
		'interactionInterpreter',
		'identifierAssigner',
		'labelOptional',
		'value',
		'min',
		'max',
		'step'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'Range-API' }
RangeWebView >> changeValueTo: aNumber [
	self currentValue: aNumber.
	self notifyInterested
]

{ #category : #accessing }
RangeWebView >> commandToComponent: convertibleToWebComponentCommand [

	commandToComponent := convertibleToWebComponentCommand asWebComponentCommand
]

{ #category : #accessing }
RangeWebView >> currentValue [
	^ value
]

{ #category : #accessing }
RangeWebView >> currentValue: anObject [
	value := anObject
]

{ #category : #accessing }
RangeWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
RangeWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
RangeWebView >> initialize [

	super initialize.
	self commandToComponent: [].
	labelOptional := Optional unused.
	interactionInterpreter := WebInteractionInterpreter forClickOnHiddenInputDependentComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'range'.
]

{ #category : #accessing }
RangeWebView >> label: aRenderable [
	labelOptional := Optional containing: aRenderable
]

{ #category : #accessing }
RangeWebView >> max [
	^ max
]

{ #category : #accessing }
RangeWebView >> max: anObject [
	max := anObject
]

{ #category : #accessing }
RangeWebView >> min [
	^ min
]

{ #category : #accessing }
RangeWebView >> min: anObject [
	min := anObject
]

{ #category : #configuring }
RangeWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
RangeWebView >> renderContentOn: aCanvas [

	| range |
	
	self renderOptionalLabelOn: aCanvas.
	range := aCanvas rangeInput.
	identifierAssigner withAssignedIdentifierDo: [ :id | range id: id ].
	commandToComponent applyTo: range on: aCanvas.
	range
		min: self min;
		max: self max;
		step: self step;
		value: self currentValue;
		callback: [ :newVal | self changeValueTo: newVal asNumber ].
	interactionInterpreter applyTo: range on: aCanvas
]

{ #category : #'rendering - private' }
RangeWebView >> renderOptionalLabelOn: aCanvas [
	labelOptional withContentDo: [ :label | 
		| id |
		id := self identifyIn: aCanvas.
		aCanvas label
			for: id;
			with: label ]
]

{ #category : #accessing }
RangeWebView >> step [
	^ step
]

{ #category : #accessing }
RangeWebView >> step: anObject [
	step := anObject
]
