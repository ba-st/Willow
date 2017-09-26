tests-configuring
testTriggerOnKeyUp

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnKeyUpApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self assert: html equals: '<input value="" name="1" id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").keyup(function(){$(this).prop("disabled",true)});</script>'