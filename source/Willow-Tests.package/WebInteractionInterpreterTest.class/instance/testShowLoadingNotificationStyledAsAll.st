tests - Configuring - DOM
testShowLoadingNotificationStyledAsAll

	| interpreter html |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.

	interpreter showLoadingNotificationStyledAsAll: #().
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(event){$("#willow-notification-section").html("<div>Loading...</div>");Willow.callServer({"url":"/","data":"1"})});</script>'