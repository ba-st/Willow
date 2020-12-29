Class {
	#name : #CombinedEventInterpreterDispatcherTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'okButton',
		'textField'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
CombinedEventInterpreterDispatcherTest >> setUp [

	super setUp.
	okButton := AsynchronicButtonWebView labeled: 'Ok'.
	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [  ]
]

{ #category : #'tests - configuring' }
CombinedEventInterpreterDispatcherTest >> testChange [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	dispatcher change inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").change(function(event){alert("A message")});$("#input-id3").change(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
CombinedEventInterpreterDispatcherTest >> testClick [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	dispatcher click inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").click(function(event){alert("A message")});$("#input-id3").click(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
CombinedEventInterpreterDispatcherTest >> testCombiningAll [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningAll: ( Array with: okButton on with: textField on ).
	dispatcher trigger inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").click(function(event){alert("A message")});$("#input-id3").change(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
CombinedEventInterpreterDispatcherTest >> testCombiningInterpretersOfAll [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	dispatcher trigger inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").click(function(event){alert("A message")});$("#input-id3").change(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
CombinedEventInterpreterDispatcherTest >> testEventNamed [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	( dispatcher eventNamed: #dblclick ) inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").dblclick(function(event){alert("A message")});$("#input-id3").dblclick(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
CombinedEventInterpreterDispatcherTest >> testKeyUp [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	dispatcher keyUp inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").keyup(function(event){alert("A message")});$("#input-id3").keyup(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
CombinedEventInterpreterDispatcherTest >> testMouseOver [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	dispatcher mouseOver inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").mouseover(function(event){alert("A message")});$("#input-id3").mouseover(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
CombinedEventInterpreterDispatcherTest >> testTrigger [

	| dispatcher html |

	dispatcher := CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll: ( Array with: okButton with: textField ).
	dispatcher trigger inform: 'A message'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: textField
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><input value="" name="2" id="input-id3" type="text"/><script type="text/javascript">$("#button-id1").click(function(event){alert("A message")});$("#input-id3").change(function(event){alert("A message")});</script>'
]
