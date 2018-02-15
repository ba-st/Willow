tests - Configuring - DOM
testEnable

	| interpreter html id |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter enable: textInput.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals: '<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){$("#15").prop("disabled",false)});</script>'