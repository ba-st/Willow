tests - Configuring
testExecuteOnClient

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter executeOnClient: [ :script :canvas | script << (JSStream on: 'window') call: 'print' ].
	html := self configureTextInputWith: interpreter.
	self assert: html equals: '<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){window.print()});</script>'