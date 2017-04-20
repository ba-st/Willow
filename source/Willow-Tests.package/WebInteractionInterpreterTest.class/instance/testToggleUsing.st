tests-Configuring-DOM
testToggleUsing

	| interpreter html |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.

	interpreter toggle: WillowCssStyles willow using: #bounce.
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});</script>'