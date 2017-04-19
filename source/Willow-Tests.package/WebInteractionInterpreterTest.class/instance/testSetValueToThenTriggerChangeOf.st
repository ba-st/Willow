tests-Configuring-DOM
testSetValueToThenTriggerChangeOf

	| interpreter html id |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	id := '15'.


	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput
				id: id;
				yourself.
			interpreter setValueTo: [ 'Ok' ] thenTriggerChangeOf: textInput.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});</script>'