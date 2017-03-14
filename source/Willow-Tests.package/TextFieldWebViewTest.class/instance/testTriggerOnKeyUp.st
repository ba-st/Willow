tests-configuring
testTriggerOnKeyUp

	| field html |

	field := TextFieldWebView singleLineTriggeringOnKeyUpApplying: CompositeComponentCommand empty.
	field onTrigger disable.
	html := self render: field.

	self
		assert: html
		equals:
			'<input value="" name="1" id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").keyup(function(){$(this).prop("disabled",true)});</script>'