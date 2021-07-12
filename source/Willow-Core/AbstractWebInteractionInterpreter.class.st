Class {
	#name : #AbstractWebInteractionInterpreter,
	#superclass : #WAObject,
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #testing }
AbstractWebInteractionInterpreter class >> isAbstract [

	^ self = AbstractWebInteractionInterpreter
]

{ #category : #'Configuring - Dialogs' }
AbstractWebInteractionInterpreter >> closeAllDialogs [

	self subclassResponsibility
]

{ #category : #'Configuring - Dialogs' }
AbstractWebInteractionInterpreter >> closeLastDialog [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> confirmAsking: aQuestion [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> disable [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> disable: aComponent [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> enable: aComponent [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> focus: anIdentifiedWebView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> focusUsing: aComponentProvider [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> inform: aMessage [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> informSelection [

	self subclassResponsibility
]

{ #category : #'Configuring - Dialogs' }
AbstractWebInteractionInterpreter >> open: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> remove: anIdentifiedView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> render: anIdentifiedView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> renderAll: anIdentifiedViewCollection [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> scrollingIntoView: anIdentifier [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
AbstractWebInteractionInterpreter >> serializeChildForm [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
AbstractWebInteractionInterpreter >> serializeContainerForm [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
AbstractWebInteractionInterpreter >> serializeForm: anIdentifiedForm [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
AbstractWebInteractionInterpreter >> serializeIt [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
AbstractWebInteractionInterpreter >> serializeWithHiddenInputs [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> serverDo: aCallbackBlock [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> setValueTo: aValueProvider thenTriggerChangeOf: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> setValueTo: aValueProvider withoutTriggeringChangeOf: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> show: aRenderable whileCallingServerToRender: anIdentifiedWebView [

	"This will replace anIdentifiedWebView contents with aRenderable in the DOM before doing the server call, 
	and replace it again with the rendering obtained from the server call response."

	self
		transform: anIdentifiedWebView into: aRenderable;
		render: anIdentifiedWebView
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> showLoadingNotificationStyledAsAll: classes [

	self subclassResponsibility
]

{ #category : #'Configuring - Serialization' }
AbstractWebInteractionInterpreter >> submitForm: anIdentifiedForm [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> submitFormStyledAs: aCssStyle [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> temporarilyDisableAndTransform: anIdentifiedView into: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> temporarilyDisableAndTransformInto: aView [

	self subclassResponsibility
]

{ #category : #'Configuring - DOM' }
AbstractWebInteractionInterpreter >> transform: anIdentifiedWebView into: aRenderable [

	"This will replace anIdentifiedWebView content with aRenderable on the browser side"

	self userAgentDo: [ :canvas | ( canvas locate: anIdentifiedWebView ) html: aRenderable ]
]

{ #category : #'Configuring - CSS' }
AbstractWebInteractionInterpreter >> updateCssClasses: aCssClassConfigurationBlock [

	self
		updateCssClasses: aCssClassConfigurationBlock
		onElementsMatching: [ :canvas | canvas jQuery this ]
]

{ #category : #'Configuring - CSS' }
AbstractWebInteractionInterpreter >> updateCssClasses: aCssClassConfigurationBlock
	onElementsMatching: anElementMatchingBlock [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> userAgentDo: aServerIndependentAction [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> with: aParameter onlyWhen: aStringCondition serverDo: aCallbackBlock [

	self subclassResponsibility
]

{ #category : #Configuring }
AbstractWebInteractionInterpreter >> with: aParameter serverDo: aCallbackBlock [

	self subclassResponsibility
]
