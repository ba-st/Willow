"
A TemporarilyDisablingCommandTest is a test class for testing the behavior of TemporarilyDisablingCommand
"
Class {
	#name : #TemporarilyDisablingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #'tests-accessing' }
TemporarilyDisablingCommandTest >> testClientIndependentActions [

	self assert: (TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas |  ]) clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
TemporarilyDisablingCommandTest >> testModelLoadingActions [

	self assert: (TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas |  ]) modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
TemporarilyDisablingCommandTest >> testPriorityActions [

	| command html |

	command := TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas | canvas span apply: [ :span | span addClass loading ] ].
	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall anchor |

			asynchronousCall := canvas jQuery ajax.
			command priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$.ajax({"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)}})});</script>'
]

{ #category : #'tests-testing' }
TemporarilyDisablingCommandTest >> testRequiresSerialization [

	self deny: (TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas |  ]) requiresSerialization
]

{ #category : #'tests-accessing' }
TemporarilyDisablingCommandTest >> testServerIndependentActions [

	| command html |

	command := TemporarilyDisablingCommand transformingCurrentViewInto: [ :canvas | canvas span apply: [ :span | span addClass loading ] ].
	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			command serverIndependentActions do: [ :action | action value: script value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){disabledComponent=$(this).html();$(this).addClass("willow-disabled-component").attr("disabled",true).html("<span class=\"willow-loading\"></span>")});</script>'
]
