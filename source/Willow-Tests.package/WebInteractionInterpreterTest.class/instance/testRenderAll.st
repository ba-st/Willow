tests - Configuring - DOM
testRenderAll

	| interpreter html id |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter renderAll: {textInput}.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).serialize()].join("&")})});</script>'