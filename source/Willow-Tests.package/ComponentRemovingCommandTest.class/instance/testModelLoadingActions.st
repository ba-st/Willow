tests-accessing
testModelLoadingActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			div := canvas div.
			canvas ensureIdFor: div.
			(ComponentRemovingCommand for: div) modelLoadingActions do: [ :action | action value: script value: canvas ].
			div script: (canvas jQuery this onClick: script) ].

	self assert: html equals: '<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$("#div-id1").remove()});</script>'