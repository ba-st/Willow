tests
testOnTrigger

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox onTrigger disable.

	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" id="select-id2" size="5"></select><script type="text/javascript">$("#select-id2").change(function(event){$(this).prop("disabled",true)});</script>'