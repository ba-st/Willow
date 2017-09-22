tests-configuring
testOnTrigger

	| field html |

	field := NumberFieldWebView applying: [ :command |  ] transformingWith: IntegerCodec new.

	field onTrigger disable.
	html := self render: field.

	self assert: html equals: '<input value="" name="1" type="number" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(){$(this).prop("disabled",true)});</script>'