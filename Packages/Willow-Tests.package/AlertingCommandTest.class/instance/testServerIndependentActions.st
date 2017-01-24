tests-accessing
testServerIndependentActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command serverIndependentActions do: [ :action | action value: script value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals: '<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){alert("Great!")});</script>'