tests-accessing
testPriorityActionsIncludeConditionalExecution

	| command html |

	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response :parameter | 'We got <1s>' expandMacrosWith: parameter ]
		executedOnlyWhen: '<1s> > 0'
		with: (JSStream on: 'worldSize').

	html := self
		renderUsing: [ :canvas | 
			| serverCall div |

			serverCall := canvas jQuery willow serverCall.
			command priorityActions do: [ :action | action value: serverCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: serverCall) ].

	self
		assert: html
		equals:
			'<div id="div-id3"></div><script type="text/javascript">$("#div-id3").click(function(){if(worldSize > 0){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(worldSize))].join("&")})}});</script>'