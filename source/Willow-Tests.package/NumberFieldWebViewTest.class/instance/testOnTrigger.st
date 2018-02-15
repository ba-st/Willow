tests-configuring
testOnTrigger

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	numberField onTrigger disable.
	html := self render: numberField.

	self assert: html equals: '<input value="" name="1" type="number" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(event){$(this).prop("disabled",true)});</script>'