tests-Configuring-DOM
testSetValueToWithoutTriggeringChangeOnComponentWithId

	| interpreter html id |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	id := '15'.

	interpreter setValueTo: [ 'Ok' ] withoutTriggeringChangeOnComponentWithId: id.

	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | 
			canvas textInput
				id: id;
				yourself ].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").click(function(){Willow.callServer({"url":"/","data":"1"})});</script>'