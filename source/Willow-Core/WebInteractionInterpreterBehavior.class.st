Class {
	#name : #WebInteractionInterpreterBehavior,
	#superclass : #WAObject,
	#category : #'Willow-Core-WebInteraction'
}

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

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> disable [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> disable: aComponent [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> enable: aComponent [

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

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreterBehavior >> open: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> remove: anIdentifiedView [

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

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> serverDo: aCallbackBlock [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> setValueTo: aValueProvider thenTriggerChangeOf: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> setValueTo: aValueProvider withoutTriggeringChangeOf: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> show: aRenderable whileCallingServerToRender: anIdentifiedWebView [

	"This will replace anIdentifiedWebView contents with aRenderable in the DOM before doing the server call, 
	and replace it again with the rendering obtained from the server call response."

	self
		transform: anIdentifiedWebView into: aRenderable;
		render: anIdentifiedWebView
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> showLoadingNotificationDisplaying: aWebView applying: aComponentCommand [

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

{ #category : #'Configuring - DOM' }
WebInteractionInterpreterBehavior >> transform: anIdentifiedWebView into: aRenderable [

	"This will replace anIdentifiedWebView content with aRenderable on the browser side"

	self userAgentDo: [ :canvas | ( canvas locate: anIdentifiedWebView ) html: aRenderable ]
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> updateCssClasses: aCssClassConfigurationBlock [

	self
		updateCssClasses: aCssClassConfigurationBlock
		onElementsMatching: [ :canvas | canvas jQuery this ]
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreterBehavior >> updateCssClasses: aCssClassConfigurationBlock
	onElementsMatching: anElementMatchingBlock [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> userAgentDo: aServerIndependentAction [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> with: aParameter onlyWhen: aStringCondition serverDo: aCallbackBlock [

	self subclassResponsibility
]

{ #category : #Configuring }
WebInteractionInterpreterBehavior >> with: aParameter serverDo: aCallbackBlock [

	self subclassResponsibility
]
