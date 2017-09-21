tests
testScriptCommands

	| html |

	html := self
		apply: (self commandBuilder script js: [ :canvas | canvas jQuery this clone ])
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="text"/><script type="text/javascript">$("#id1").clone();</script>'