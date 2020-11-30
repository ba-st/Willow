"
I'm a builder of AjaxAwareErrorHandlers, just because you cannot control the creation of them.
"
Class {
	#name : #AjaxAwareErrorHandlerFactory,
	#superclass : #GRObject,
	#instVars : [
		'reportingActionOptional',
		'rootCommandOptional',
		'nonAjaxRenderBlockOptional',
		'ajaxErrorHandlers'
	],
	#category : #'Willow-Core-Applications'
}

{ #category : #'Error Handler - API' }
AjaxAwareErrorHandlerFactory >> , anException [

	^ ajaxErrorHandlers keys
		inject: AjaxAwareErrorHandler , anException
		into: [ :exceptionSet :currentExceptionSelector | exceptionSet , currentExceptionSelector ]
]

{ #category : #'Error Handler - API' }
AjaxAwareErrorHandlerFactory >> context: aRequestContext [

	| handler |

	handler := AjaxAwareErrorHandler context: aRequestContext.
	reportingActionOptional withContentDo: [ :reportingAction | handler reportingAction: reportingAction ].
	rootCommandOptional withContentDo: [ :rootCommand | handler updateRootWith: rootCommand ].
	nonAjaxRenderBlockOptional withContentDo: [ :nonAjaxRenderBlock | handler renderNonAjaxErrorsWith: nonAjaxRenderBlock ].
	ajaxErrorHandlers
		keysAndValuesDo: [ :exceptionSelector :action | 
			handler
				on: exceptionSelector
				do: action ].
	^ handler
]

{ #category : #'Error Handler - API' }
AjaxAwareErrorHandlerFactory >> handleExceptionsDuring: aBlock context: aRequestContext [

	^ (self context: aRequestContext) handleExceptionsDuring: aBlock
]

{ #category : #'Error Handler - API' }
AjaxAwareErrorHandlerFactory >> handles: anException [

	^ (AjaxAwareErrorHandler handles: anException)
		or: [ ajaxErrorHandlers keys anySatisfy: [ :handler | handler handles: anException ] ]
]

{ #category : #initialization }
AjaxAwareErrorHandlerFactory >> initialize [

	super initialize.
	ajaxErrorHandlers := GRSmallDictionary new.
	reportingActionOptional := Optional unused.
	nonAjaxRenderBlockOptional := Optional unused.
	rootCommandOptional := Optional unused
]

{ #category : #'Error Handler - API' }
AjaxAwareErrorHandlerFactory >> internalError: anError context: aRequestContext [

	^ (self context: aRequestContext) internalError: anError
]

{ #category : #Configuring }
AjaxAwareErrorHandlerFactory >> on: anExceptionSelector do: aBlock [

	ajaxErrorHandlers at: anExceptionSelector put: aBlock
]

{ #category : #Configuring }
AjaxAwareErrorHandlerFactory >> renderNonAjaxErrorsWith: aDyadicBlock [

	nonAjaxRenderBlockOptional := Optional containing: aDyadicBlock
]

{ #category : #Configuring }
AjaxAwareErrorHandlerFactory >> reportingAction: aMonadycBlock [

	reportingActionOptional := Optional containing: aMonadycBlock
]

{ #category : #Configuring }
AjaxAwareErrorHandlerFactory >> updateRootWith: aBlock [

	rootCommandOptional := Optional containing: aBlock
]
