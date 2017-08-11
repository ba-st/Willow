tests - Configuring - DOM
testDisable

	| interpreter html id |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter disable.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals: '<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(){$(this).prop("disabled",true)});</script>'