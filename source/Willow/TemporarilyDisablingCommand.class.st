"
I'm a WebInteractionCommand that disable an specific component during an AJAX call execution.
"
Class {
	#name : #TemporarilyDisablingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'componentProvider',
		'viewWhileDisabled'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #'Instance Creation' }
TemporarilyDisablingCommand class >> transforming: anIdentifieView into: aViewWhileDisabled [

	^ self
		transformingComponentMatching: [ :canvas | 
			anIdentifieView identifyIn: canvas.
			canvas jQuery id: anIdentifieView identifier ]
		into: aViewWhileDisabled
]

{ #category : #'Instance Creation' }
TemporarilyDisablingCommand class >> transformingComponentMatching: aComponentProvider into: aViewWhileDisabled [

	^self new initializeTransformingComponentMatching: aComponentProvider into: aViewWhileDisabled
]

{ #category : #'Instance Creation' }
TemporarilyDisablingCommand class >> transformingCurrentViewInto: aViewWhileDisabled [

	^self transformingComponentMatching: [:canvas | canvas jQuery this] into: aViewWhileDisabled
]

{ #category : #accessing }
TemporarilyDisablingCommand >> clientIndependentActions [

	^#()
]

{ #category : #private }
TemporarilyDisablingCommand >> componentToDisableOn: aCanvas [

	^componentProvider value: aCanvas
]

{ #category : #private }
TemporarilyDisablingCommand >> disabledAttributeName [
	^ Willow constants >> #willow >> #disabledAttributeName
]

{ #category : #private }
TemporarilyDisablingCommand >> disabledComponentVariableName [

	^'disabledComponent'
]

{ #category : #initialization }
TemporarilyDisablingCommand >> initializeTransformingComponentMatching: aComponentProvider into: aViewWhileDisabled [

	viewWhileDisabled := aViewWhileDisabled.
	componentProvider := aComponentProvider
]

{ #category : #accessing }
TemporarilyDisablingCommand >> modelLoadingActions [

	^#()
]

{ #category : #accessing }
TemporarilyDisablingCommand >> priorityActions [

	^ Array
		with: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				onComplete:
					((aCanvas jQuery class: Willow classes >> #disabledComponent)
						attributeAt: self disabledAttributeName put: false;
						removeClass: Willow classes >> #disabledComponent;
						call: 'html' with: (aCanvas jQuery alias: self disabledComponentVariableName)) ]
]

{ #category : #testing }
TemporarilyDisablingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
TemporarilyDisablingCommand >> serverIndependentActions [

	^ Array
		with: [ :script :canvas | 
			script
				<< ((self componentToDisableOn: canvas) html assignTo: self disabledComponentVariableName).
			script
				<<
					((self componentToDisableOn: canvas)
						addClass: Willow classes >> #disabledComponent;
						attributeAt: self disabledAttributeName put: true;
						html: viewWhileDisabled) ]
]
