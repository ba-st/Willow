tests
testCompositeCommand

	| html |

	html := self
		apply: [ :field | (field addScript js: [ :canvas | canvas jQuery this clone ]) + field bePasswordInput ] asWebComponentCommand
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input id="id1" type="password"/><script type="text/javascript">$("#id1").clone();</script>'