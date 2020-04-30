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
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #accessing }
TemporarilyDisablingCommand class >> componentToDisableVariableName [

	^ 'componentToDisable'
]

{ #category : #'instance creation' }
TemporarilyDisablingCommand class >> transforming: anIdentifieView into: aViewWhileDisabled [

	^ self
		transformingComponentMatching: [ :canvas | 
			anIdentifieView identifyIn: canvas.
			canvas jQuery id: anIdentifieView identifier
			]
		into: aViewWhileDisabled
]

{ #category : #'instance creation' }
TemporarilyDisablingCommand class >> transformingComponentMatching: aComponentProvider into: aViewWhileDisabled [

	^ self new initializeTransformingComponentMatching: aComponentProvider into: aViewWhileDisabled
]

{ #category : #'instance creation' }
TemporarilyDisablingCommand class >> transformingCurrentViewInto: aViewWhileDisabled [

	^ self transformingComponentMatching: [ :canvas | canvas jQuery this ] into: aViewWhileDisabled
]

{ #category : #private }
TemporarilyDisablingCommand >> areEventsEnabledOn: aCanvas [

	^ ( ( self componentToDisableVariableOn: aCanvas ) attributeAt: self eventsDisabledAttributeName )
		notIdenticalTo: 'disabled'
]

{ #category : #accessing }
TemporarilyDisablingCommand >> clientIndependentActions [

	^ #()
]

{ #category : #private }
TemporarilyDisablingCommand >> componentToDisableOn: aCanvas [

	^ componentProvider value: aCanvas
]

{ #category : #private }
TemporarilyDisablingCommand >> componentToDisableVariableName [

	^ self class componentToDisableVariableName
]

{ #category : #private }
TemporarilyDisablingCommand >> componentToDisableVariableOn: aCanvas [

	^ aCanvas jQuery new alias: self componentToDisableVariableName
]

{ #category : #private }
TemporarilyDisablingCommand >> disabledAttributeName [

	^ Constants >> #willow >> #disabledAttributeName
]

{ #category : #private }
TemporarilyDisablingCommand >> eventsDisabledAttributeName [

	^ 'data-willow-events-disabled'
]

{ #category : #initialization }
TemporarilyDisablingCommand >> initializeTransformingComponentMatching: aComponentProvider into: aViewWhileDisabled [

	viewWhileDisabled := aViewWhileDisabled.
	componentProvider := aComponentProvider
]

{ #category : #accessing }
TemporarilyDisablingCommand >> modelLoadingActions [

	^ #()
]

{ #category : #private }
TemporarilyDisablingCommand >> originalContentAttributeName [

	^ 'data-original-html'
]

{ #category : #accessing }
TemporarilyDisablingCommand >> priorityActions [

	^ Array
		with: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				addDecoration: ( JSConcatenateBefore on: ( self stepsBeforeServelCallOn: aCanvas ) ).
			anAsynchronousCall condition: ( self areEventsEnabledOn: aCanvas ).
			anAsynchronousCall onComplete: ( self stepsAfterServerCallOn: aCanvas )
			]
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
				<< ( ( self componentToDisableOn: canvas ) assignLocalTo: self componentToDisableVariableName )
			]
]

{ #category : #private }
TemporarilyDisablingCommand >> stepsAfterServerCallOn: aCanvas [

	^ ( self componentToDisableVariableOn: aCanvas )
		removeAttribute: self eventsDisabledAttributeName;
		attributeAt: self disabledAttributeName put: false;
		removeClass: Willow classification >> #disabledComponent;
		call: 'html'
			with:
			( ( self componentToDisableVariableOn: aCanvas ) attributeAt: self originalContentAttributeName )
]

{ #category : #private }
TemporarilyDisablingCommand >> stepsBeforeServelCallOn: aCanvas [

	^ ( self componentToDisableVariableOn: aCanvas )
		attributeAt: self eventsDisabledAttributeName put: 'disabled';
		addClass: Willow classification >> #disabledComponent;
		attributeAt: self originalContentAttributeName
			put: ( self componentToDisableVariableOn: aCanvas ) html;
		attributeAt: self disabledAttributeName put: true;
		html: viewWhileDisabled
]
