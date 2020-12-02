"
A SerializationCommandTest is a test class for testing the behavior of SerializationCommand
"
Class {
	#name : #SerializationCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
SerializationCommandTest >> setUp [

	super setUp.
	command := SerializationCommand forCurrentObject
]

{ #category : #'tests-accessing' }
SerializationCommandTest >> testForChildForm [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall div |

			asynchronousCall := canvas jQuery ajax.
			SerializationCommand forChildForm priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals: '<div id="div-id2"></div><script type="text/javascript">$("#div-id2").click(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).children("form").serialize()].join("&")})});</script>'
]

{ #category : #'tests-accessing' }
SerializationCommandTest >> testForCurrentObjectWithHiddenInputs [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall div |

			asynchronousCall := canvas jQuery ajax.
			SerializationCommand forCurrentObjectWithHiddenInputs priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals: '<div id="div-id2"></div><script type="text/javascript">$("#div-id2").click(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&")})});</script>'
]

{ #category : #'tests-accessing' }
SerializationCommandTest >> testForParentForm [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall input |

			asynchronousCall := canvas jQuery ajax.
			SerializationCommand forParentForm priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			input := canvas textInput.
			canvas ensureIdFor: input.
			input script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).closest("form").find(":input").serialize()].join("&")})});</script>'
]

{ #category : #'tests-accessing' }
SerializationCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
SerializationCommandTest >> testPriorityActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall input |

			asynchronousCall := canvas jQuery ajax.
			command priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			input := canvas textInput.
			canvas ensureIdFor: input.
			input script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).serialize()].join("&")})});</script>'
]

{ #category : #'tests-testing' }
SerializationCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization 
]

{ #category : #'tests-accessing' }
SerializationCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
