Class {
	#name : #EventInterpreterDispatcherTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #'test support' }
EventInterpreterDispatcherTest >> configureTextInputWith: aDispatcher [

	^ self apply: aDispatcher toComponentDefinedBy: [ :canvas | canvas textInput ]
]

{ #category : #'tests - evaluating' }
EventInterpreterDispatcherTest >> testApplyToOn [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToClick.
	dispatcher trigger inform: 'A message'.
	html := self apply: dispatcher toComponentDefinedBy: [ :canvas | canvas button ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="submit"></button><script type="text/javascript">$("#button-id1").click(function(event){alert("A message")});</script>'
			
]

{ #category : #'tests - configuring' }
EventInterpreterDispatcherTest >> testChange [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToClick.
	dispatcher change inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").change(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
EventInterpreterDispatcherTest >> testClick [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChange.
	dispatcher click inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
EventInterpreterDispatcherTest >> testDefaultingToChange [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChange.
	dispatcher trigger inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").change(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
EventInterpreterDispatcherTest >> testDefaultingToChangeHidden [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChangeHidden.
	dispatcher trigger inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").change(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
EventInterpreterDispatcherTest >> testDefaultingToClick [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToClick.
	dispatcher trigger inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
EventInterpreterDispatcherTest >> testDefaultingToClickHidden [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToClickHidden.
	dispatcher trigger inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){alert("A message")});</script>'
]

{ #category : #'tests - instance creation' }
EventInterpreterDispatcherTest >> testDefaultingToKeyUp [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToKeyUp.
	dispatcher trigger inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").keyup(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
EventInterpreterDispatcherTest >> testEventNamed [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChange.
	( dispatcher eventNamed: #dblclick ) inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").dblclick(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
EventInterpreterDispatcherTest >> testKeyUp [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChange.
	dispatcher keyUp inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").keyup(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
EventInterpreterDispatcherTest >> testMouseOver [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChange.
	dispatcher mouseOver inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").mouseover(function(event){alert("A message")});</script>'
]

{ #category : #'tests - configuring' }
EventInterpreterDispatcherTest >> testTrigger [

	| dispatcher html |

	dispatcher := EventInterpreterDispatcher defaultingToChange.
	dispatcher trigger inform: 'A message'.
	html := self configureTextInputWith: dispatcher.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").change(function(event){alert("A message")});</script>'
]
