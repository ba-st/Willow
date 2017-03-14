tests-rendering
testOnTrigger

	| listBox html |

	listBox := self newListBox.
	listBox onTrigger disable.

	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" id="select-id2" multiple="multiple"></select><input name="3" type="hidden"/><script type="text/javascript">$("#select-id2").change(function(){$(this).prop("disabled",true)});</script>'