tests
testOnTrigger

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	dateField onTrigger disable.
	html := self render: dateField.

	self assert: html equals: '<input value="" name="1" type="date" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(event){$(this).prop("disabled",true)});</script>'