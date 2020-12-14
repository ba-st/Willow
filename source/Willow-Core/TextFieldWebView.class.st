"
I enable the user to input text information. I support single-line text box when only one line of input is required, and a multi-line text box only if more than one line of input may be required.
"
Class {
	#name : #TextFieldWebView,
	#superclass : #FieldWebView,
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
TextFieldWebView class >> multiLineTriggeringOnChangeApplying: aComponentCommand [

	^ self
		forComponentBuiltUsing: [ :canvas | canvas textArea ]
		withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue
		applying: aComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> multiLineTriggeringOnKeyUpApplying: aComponentCommand [

	^ self forComponentBuiltUsing: [ :canvas | canvas textArea ] withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent applying: aComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> singleLineTriggeringOnChangeApplying: aComponentCommand [

	^ self
		forComponentBuiltUsing: [ :canvas | canvas textInput ]
		withInteractionDefinedBy: self changeInterpreter
		applying: aComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> singleLineTriggeringOnKeyUpApplying: aComponentCommand [

	^ self forComponentBuiltUsing: [ :canvas | canvas textInput ] withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent applying: aComponentCommand
]

{ #category : #'private - Accessing' }
TextFieldWebView >> identifierPrefix [

	^ 'text'
]

{ #category : #'private - Accessing' }
TextFieldWebView >> textCodec [

	^ NullCodec new
]
