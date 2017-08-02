tests-accessing
testModelLoadingActions

	| command html |

	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response :parameter | response onReturn inform: parameter ]
		with: 'test complete'.
	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command priorityActions do: [ :action | action value: self value: 'canvas' ].
			command clientIndependentActions do: #value.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){alert("test complete")});</script>'