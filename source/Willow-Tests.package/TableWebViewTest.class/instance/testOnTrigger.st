tests-rendering
testOnTrigger

	| table html |

	table := TableWebView headlessDefinedBy: (Array with: (WebTableColumnRenderer untitledRenderingItemWith: [ :number | number even ])) applying: [  ].

	table onTrigger disable.

	html := self render: table.

	self
		assert: html equals: '<table id="table-id1"><tbody></tbody></table><script type="text/javascript">$("#table-id1").click(function(){$(this).prop("disabled",true)});</script>';
		assert: table identifier equals: 'table-id1'