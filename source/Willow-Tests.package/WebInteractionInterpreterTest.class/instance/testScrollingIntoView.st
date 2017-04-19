tests-Configuring-DOM
testScrollingIntoView

	| interpreter html id |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.
	id := '15'.
	interpreter scrollingIntoView: id.
	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});</script>'