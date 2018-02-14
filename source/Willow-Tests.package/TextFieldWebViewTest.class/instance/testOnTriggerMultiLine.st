tests-configuring
testOnTriggerMultiLine

	| textField html |

	textField := TextFieldWebView multiLineTriggeringOnChangeApplying: [ :field |  ].
	textField onTrigger disable.
	html := self render: textField.

	self
		assert: html
		equals: '<textarea rows="auto" cols="auto" name="1" id="textarea-id2"></textarea><script type="text/javascript">$("#textarea-id2").change(function(event){$(this).prop("disabled",true)});</script>'