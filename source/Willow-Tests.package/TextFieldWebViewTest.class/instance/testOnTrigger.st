tests-configuring
testOnTrigger

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self assert: html equals: '<input value="" name="1" id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(){$(this).prop("disabled",true)});</script>'