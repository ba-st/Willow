tests-Configuring - Dialogs
testOpen

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter open: [ :canvas | canvas dialog attributeAt: 'open' put: true ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});</script>'