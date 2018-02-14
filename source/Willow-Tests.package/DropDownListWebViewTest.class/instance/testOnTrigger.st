tests-configuring
testOnTrigger

	| dropDownList html |

	dropDownList := self newSingleSelectionView.
	dropDownList onTrigger disable.

	html := self render: dropDownList.

	self assert: html equals: '<select name="1" id="select-id2"></select><script type="text/javascript">$("#select-id2").change(function(event){$(this).prop("disabled",true)});</script>'