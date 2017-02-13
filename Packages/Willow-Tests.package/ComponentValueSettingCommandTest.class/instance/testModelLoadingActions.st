tests-accessing
testModelLoadingActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script input |

			script := canvas javascript.
			input := canvas textInput.
			canvas ensureIdFor: input.

			(ComponentValueSettingCommand triggeringChangesObtainingIdentifierFrom: [ input id ] valueFrom: [ '15' ]) modelLoadingActions do: [ :action | action value: script value: canvas ].
			input script: (canvas jQuery this onClick: script) ].

	self assert: html equals: '<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$("#input-id1").val("15").trigger("change")});</script>'