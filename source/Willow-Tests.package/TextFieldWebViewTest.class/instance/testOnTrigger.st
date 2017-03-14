tests-configuring
testOnTrigger

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty.
	field onTrigger disable.
	html := self render: field.

	self
		assert: html
		equals:
			'<input value="" name="1" id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(){$(this).prop("disabled",true)});</script>'