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

{ #category : #'instance creation' }
CombinedWebInteractionInterpreter class >> combiningInterpretersOf: aWebViewCollection [

	^self
		combining: (aWebViewCollection collect: [:aWebView | aWebView onTrigger])
]

{ #category : #'Configuring - CSS' }
CombinedWebInteractionInterpreter >> addCssClass: aCssStyle toComponentsMatching: aComponentProvider [

	self interpretersDo: [:interpreter |
		interpreter addCssClass: aCssStyle toComponentsMatching: aComponentProvider]
]

{ #category : #'Configuring - CSS' }
CombinedWebInteractionInterpreter >> changeCssClass: anExistingStyle to: aNewStyle [

	self interpretersDo: [:interpreter | interpreter changeCssClass: anExistingStyle to: aNewStyle]
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

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> determineBehaviorByEvaluating: aCallbackBlock [

	self interpretersDo: [:interpreter | interpreter determineBehaviorByEvaluating: aCallbackBlock]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	self interpretersDo: [:interpreter |
		interpreter determineBehaviorByEvaluating: aCallbackBlock with: aParameter]
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

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> executeOnClient: aServerIndependentAction [

	self interpretersDo: [:interpreter | interpreter executeOnClient: aServerIndependentAction]
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

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> onlyWhen: aStringCondition determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	self
		interpretersDo: [ :interpreter | 
			interpreter
				onlyWhen: aStringCondition
				determineBehaviorByEvaluating: aCallbackBlock
				with: aParameter ]
]

{ #category : #'Configuring - Dialogs' }
CombinedWebInteractionInterpreter >> open: aView [

	self interpretersDo: [ :interpreter | interpreter open: aView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> remove: anIdentifiedView [

	self interpretersDo: [ :interpreter | interpreter remove: anIdentifiedView ]
]

{ #category : #'Configuring - CSS' }
CombinedWebInteractionInterpreter >> removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider [

	self interpretersDo: [ :interpreter | interpreter removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider ]
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

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView [

	self
		interpretersDo:
			[ :interpreter | interpreter setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView ]
]

{ #category : #'Configuring - DOM' }
CombinedWebInteractionInterpreter >> setValueTo: aValueProvider withoutTriggeringChangeOnComponentWithId: identifier [

	self
		interpretersDo:
			[ :interpreter | interpreter setValueTo: aValueProvider withoutTriggeringChangeOnComponentWithId: identifier ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> showLoadingNotificationStyledAsAll: classes [

	self interpretersDo: [:interpreter | interpreter showLoadingNotificationStyledAsAll: classes]
]

{ #category : #'Configuring - Serialization' }
CombinedWebInteractionInterpreter >> submitForm: anIdentifiedForm [

	self interpretersDo: [ :interpreter | interpreter submitForm: anIdentifiedForm ]
]

{ #category : #Configuring }
CombinedWebInteractionInterpreter >> submitFormStyledAs: aCssStyle [

	self interpretersDo: [:interpreter | interpreter submitFormStyledAs: aCssStyle]
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
CombinedWebInteractionInterpreter >> toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider [

	self interpretersDo: [ :interpreter | interpreter toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider ]
]
