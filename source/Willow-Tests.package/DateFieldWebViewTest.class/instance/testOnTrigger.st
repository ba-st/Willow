tests
testOnTrigger

	| field html |

	field := DateFieldWebView applying: CompositeComponentCommand empty.

	field onTrigger disable.
	html := self render: field.

	self
		assert: html
		equals:
			'<input value="" name="1" type="date" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(){$(this).prop("disabled",true)});</script>'