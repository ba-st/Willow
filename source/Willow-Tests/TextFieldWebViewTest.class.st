"
A TextFieldWebViewTest is a test class for testing the behavior of TextFieldWebView
"
Class {
	#name : #TextFieldWebViewTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : 'Willow-Tests-WebViews'
}

{ #category : #'test support' }
TextFieldWebViewTest >> changeNotifiedBy: aTextFieldWebView [

	notificationWasReceived := true
]

{ #category : #'tests-container-API' }
TextFieldWebViewTest >> testContents [

	| textField |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].

	self assert: textField contents isEmpty.

	textField changeContentsTo: 'Hello World!'.

	self assert: textField contents equals: 'Hello World!'
]

{ #category : #'tests-configuring' }
TextFieldWebViewTest >> testIdentifyIn [

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].
	html := self
		renderUsing: [ :canvas | 
			textField identifyIn: canvas.
			canvas render: textField ].

	self
		assert: html equals: '<input value="" name="2" id="text-id1" type="text"/>';
		assert: textField identifier equals: 'text-id1'
]

{ #category : #'tests-container-API' }
TextFieldWebViewTest >> testNotifyChangesTo [

	| textField |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].

	textField notifyChangesTo: self.
	notificationWasReceived := false.
	textField changeContentsTo: ''.
	self assert: notificationWasReceived
]

{ #category : #'tests-configuring' }
TextFieldWebViewTest >> testOnTrigger [

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self assert: html equals: '<input value="" name="1" id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-configuring' }
TextFieldWebViewTest >> testOnTriggerMultiLine [

	| textField html |

	textField := TextFieldWebView multiLineTriggeringOnChangeApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self
		assert: html
		equals: '<textarea rows="auto" cols="auto" name="1" id="textarea-id2"></textarea><script type="text/javascript">$("#textarea-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
TextFieldWebViewTest >> testRenderContentOn [

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].

	html := self render: textField.

	self assert: html equals: '<input value="" name="1" type="text"/>'
]

{ #category : #'tests-rendering' }
TextFieldWebViewTest >> testRenderContentOnApplyingCommands [

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field | (field setNameTo: 'Neo') + field bePasswordInput ].

	html := self render: textField.

	self assert: html equals: '<input value="" name="Neo" type="password"/>'
]

{ #category : #'tests-rendering' }
TextFieldWebViewTest >> testRenderMultiLineContentWithContents [

	| textField html |

	textField := TextFieldWebView multiLineTriggeringOnChangeApplying: [ :field |  ].
	textField changeContentsTo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' expandMacros.

	html := self render: textField.

	self
		assert: html
		equals: '<textarea rows="auto" cols="auto" name="1">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</textarea>'
]

{ #category : #'tests-rendering' }
TextFieldWebViewTest >> testRenderSingleLineContentWithContents [

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].
	textField changeContentsTo: 'S & P'.
	html := self render: textField.

	self assert: html equals: '<input value="S &amp; P" name="1" type="text"/>'
]

{ #category : #'tests-configuring' }
TextFieldWebViewTest >> testTriggerOnKeyUp [

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnKeyUpApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self assert: html equals: '<input value="" name="1" id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").keyup(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-configuring' }
TextFieldWebViewTest >> testTriggerOnKeyUpMultiLine [

	| textField html |

	textField := TextFieldWebView multiLineTriggeringOnKeyUpApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self
		assert: html
		equals: '<textarea rows="auto" cols="auto" name="1" id="textarea-id2"></textarea><script type="text/javascript">$("#textarea-id2").keyup(function(event){$(this).prop("disabled",true)});</script>'
]
