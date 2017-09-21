tests
testDeselectAllOptionsCommands

	| html |

	html := self apply: self commandBuilder deselectAllOptions toComponentDefinedBy: [ :canvas | canvas select ].

	self
		assert: html
		equals: '<select id="id1"></select><script type="text/javascript">$("#id1").prop("selectedIndex",-1);</script>'