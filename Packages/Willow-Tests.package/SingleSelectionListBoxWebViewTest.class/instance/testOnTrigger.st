tests
testOnTrigger

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox onTrigger disable.

	html := self render: listBox.

	self assert: html equals: '<select size="5" name="1" id="select-id2"></select><script type="text/javascript">$("#select-id2").change(function(){$(this).prop("disabled",true)});</script>'