Class {
	#name : #WebInteractionInterpreterBehavior,
	#superclass : #Object,
	#category : 'Willow-WebInteraction'
}

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> addCssClass: aCssStyle [

	self subclassResponsibility
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> addCssClass: aCssStyle toComponentsMatching: aComponentProvider [

	self subclassResponsibility
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> changeCssClass: anExistingStyle to: aNewStyle [

	self subclassResponsibility
]

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreterBehavior >> closeAllDialogs [

	self subclassResponsibility
]

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreterBehavior >> closeLastDialog [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> confirmAsking: aQuestion [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> determineBehaviorByEvaluating: aCallbackBlock [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> disable [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> enable: aComponent [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> evaluate: aCallbackBlock [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> evaluate: aCallbackBlock with: aParameter [

	self subclassResponsibility 
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> executeOnClient: aServerIndependentAction [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> focus: anIdentifiedWebView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> focusUsing: aComponentProvider [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> inform: aMessage [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> informSelection [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> onlyWhen: aStringCondition determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	self subclassResponsibility
]

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreterBehavior >> open: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> remove: anIdentifiedView [

	self subclassResponsibility
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider [

	self subclassResponsibility
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> removeCssClass: aCssStyle fromComponentsWithClass: aComponentByStyleName [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> render: anIdentifiedView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> renderAll: anIdentifiedViewCollection [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> scrollingIntoView: anIdentifier [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreterBehavior >> serializeChildForm [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreterBehavior >> serializeContainerForm [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreterBehavior >> serializeForm: anIdentifiedForm [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreterBehavior >> serializeIt [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreterBehavior >> serializeWithHiddenInputs [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> setValueTo: aValueProviders withoutTriggeringChangeOnComponentWithId: identifier [ 

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> showLoadingNotificationStyledAsAll: classes [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreterBehavior >> submitForm: anIdentifiedForm [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> submitFormStyledAs: aCssStyle [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> temporarilyDisableAndTransform: anIdentifiedView into: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> temporarilyDisableAndTransformInto: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle [

	self subclassResponsibility
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle on: anIdentifiedWebView [

	self
		toggleCssClass: aCssStyle
		onComponentsMatching: [ :javascript | 
			anIdentifiedWebView identifyIn: javascript.
			javascript jQuery id: anIdentifiedWebView identifier ]
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider [

	self subclassResponsibility
]
