Class {
	#name : #CombinedWebInteractionInterpreter,
	#superclass : #WebInteractionInterpreterBehavior,
	#instVars : [
		'interpreters'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
CombinedWebInteractionInterpreter class >> combining: aWebInteractionInterpreterCollection [

	^self new initializeCombining: aWebInteractionInterpreterCollection
]

{ #category : #'Configuring - Dialogs' }
CombinedWebInteractionInterpreter >> closeAllDialogs [

	self interpretersDo: [ :interpreter | interpreter closeAllDialogs ]
]

{ #category : #'Configuring - Dialogs' }
CombinedWebInteractionInterpreter >> closeLastDialog [

	self interpretersDo: [ :interpreter | interpreter closeLastDialog ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> confirmAsking: aQuestion [

	self interpretersDo: [:interpreter | interpreter confirmAsking: aQuestion] 
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> disable [

	self interpretersDo: [ :interpreter | interpreter disable ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> disable: aComponent [

	self interpretersDo: [ :interpreter | interpreter disable: aComponent ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> enable: aComponent [

	self interpretersDo: [ :interpreter | interpreter enable: aComponent ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> focus: anIdentifiedWebView [

	self interpretersDo: [ :interpreter | interpreter focus: anIdentifiedWebView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> focusUsing: aComponentProvider [

	self interpretersDo: [ :interpreter | interpreter focusUsing: aComponentProvider ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> inform: aMessage [

	self interpretersDo: [:interpreter | interpreter inform: aMessage]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> informSelection [

	self interpretersDo: [:interpreter | interpreter informSelection]
]

{ #category : #initialization }
CombinedWebInteractionInterpreter >> initializeCombining: aWebInteractionInterpreterCollection [

	interpreters := aWebInteractionInterpreterCollection
]

{ #category : #private }
CombinedWebInteractionInterpreter >> interpretersDo: aBlock [

	interpreters do: aBlock
]

{ #category : #'Configuring - Dialogs' }
CombinedWebInteractionInterpreter >> open: aView [

	self interpretersDo: [ :interpreter | interpreter open: aView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> remove: anIdentifiedView [

	self interpretersDo: [ :interpreter | interpreter remove: anIdentifiedView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> render: anIdentifiedView [

	self interpretersDo: [ :interpreter | interpreter render: anIdentifiedView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> renderAll: anIdentifiedViewCollection [

	self interpretersDo: [ :interpreter | interpreter renderAll: anIdentifiedViewCollection ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> scrollingIntoView: anIdentifier [

	self interpretersDo: [:interpreter | interpreter scrollingIntoView: anIdentifier]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> serializeChildForm [

	self interpretersDo: [:interpreter | interpreter serializeChildForm]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> serializeContainerForm [

	self interpretersDo: [:interpreter | interpreter serializeContainerForm]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> serializeForm: anIdentifiedForm [

	self interpretersDo: [ :interpreter | interpreter serializeForm: anIdentifiedForm ]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> serializeIt [

	self interpretersDo: [:interpreter | interpreter serializeIt]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> serializeWithHiddenInputs [

	self interpretersDo: [:interpreter | interpreter serializeWithHiddenInputs]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> serverDo: aCallbackBlock [

	self interpretersDo: [ :interpreter | interpreter serverDo: aCallbackBlock ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView [

	self
		interpretersDo: [ :interpreter | interpreter setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> setValueTo: aValueProvider withoutTriggeringChangeOf: aView [

	self
		interpretersDo: [ :interpreter | interpreter setValueTo: aValueProvider withoutTriggeringChangeOf: aView ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> showLoadingNotificationStyledAsAll: classes [

	self interpretersDo: [ :interpreter | interpreter showLoadingNotificationStyledAsAll: classes ]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> submitForm: anIdentifiedForm [

	self interpretersDo: [ :interpreter | interpreter submitForm: anIdentifiedForm ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> submitFormStyledAs: aCssStyle [

	self interpretersDo: [ :interpreter | interpreter submitFormStyledAs: aCssStyle ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> temporarilyDisableAndTransform: anIdentifiedView into: aView [

	self
		interpretersDo: [ :interpreter | interpreter temporarilyDisableAndTransform: anIdentifiedView into: aView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> temporarilyDisableAndTransformInto: aView [

	self interpretersDo: [ :interpreter | interpreter temporarilyDisableAndTransformInto: aView ]
]

{ #category : #'Configuring - CSS' }
CombinedWebInteractionInterpreter >> updateCssClasses: aCssClassConfigurationBlock
	onElementsMatching: anElementMatchingBlock [

	self
		interpretersDo:
			[ :interpreter | interpreter updateCssClasses: aCssClassConfigurationBlock onElementsMatching: anElementMatchingBlock ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> userAgentDo: aServerIndependentAction [

	self interpretersDo: [ :interpreter | interpreter userAgentDo: aServerIndependentAction ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> with: aParameter onlyWhen: aStringCondition serverDo: aCallbackBlock [

	self
		interpretersDo: [ :interpreter | interpreter with: aParameter onlyWhen: aStringCondition serverDo: aCallbackBlock ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> with: aParameter serverDo: aCallbackBlock [

	self interpretersDo: [ :interpreter | interpreter with: aParameter serverDo: aCallbackBlock ]
]
